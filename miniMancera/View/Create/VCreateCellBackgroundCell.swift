import UIKit

class VCreateCellBackgroundCell:UICollectionViewCell
{
    private weak var background:UIView?
    private weak var imageIndicator:UIImageView!
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        
        let imageIndicator:UIImageView = UIImageView()
        imageIndicator.translatesAutoresizingMaskIntoConstraints = false
        imageIndicator.clipsToBounds = true
        imageIndicator.isUserInteractionEnabled = false
        imageIndicator.contentMode = UIViewContentMode.bottomRight
        imageIndicator.image = #imageLiteral(resourceName: "assetGenericCreateSelected")
        self.imageIndicator = imageIndicator
        
        addSubview(imageIndicator)
        
        NSLayoutConstraint.equals(
            view:imageIndicator,
            toView:self)
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        return nil
    }
    
    override var isSelected:Bool
    {
        didSet
        {
            hover()
        }
    }
    
    override var isHighlighted:Bool
    {
        didSet
        {
            hover()
        }
    }
    
    //MARK: private
    
    private func hover()
    {
        if isSelected || isHighlighted
        {
            background?.layer.borderWidth = 2
            imageIndicator.isHidden = false
        }
        else
        {
            background?.layer.borderWidth = 0
            imageIndicator.isHidden = true
        }
    }
    
    //MARK: public
    
    func config(model:MCreateBackgroundProtocol)
    {
        self.background?.removeFromSuperview()
        
        let width:CGFloat = bounds.maxX
        let height:CGFloat = bounds.maxY
        let height_2:CGFloat = height / 2.0
        let remainWidth:CGFloat = width - height
        let marginLeft:CGFloat = remainWidth / 2.0
        
        let background:UIView = model.view()
        background.layer.borderColor = UIColor.black.cgColor
        background.layer.cornerRadius = height_2
        self.background = background
        
        insertSubview(background, at:0)
        
        NSLayoutConstraint.equalsVertical(
            view:background,
            toView:self)
        NSLayoutConstraint.leftToLeft(
            view:background,
            toView:self,
            constant:marginLeft)
        NSLayoutConstraint.width(
            view:background,
            constant:height)
        
        hover()
    }
}
