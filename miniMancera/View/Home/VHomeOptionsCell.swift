import UIKit

class VHomeOptionsCell:UICollectionViewCell
{
    private weak var imageView:UIImageView!
    private weak var labelTitle:UILabel!
    private let kAlphaSelected:CGFloat = 0.4
    private let kAlphaNotSelected:CGFloat = 1
    private let kImageBottom:CGFloat = -40
    private let kTitleHeight:CGFloat = 100
    private let kTitleMargin:CGFloat = 10
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        clipsToBounds = true
        
        let labelTitle:UILabel = UILabel()
        labelTitle.isUserInteractionEnabled = false
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.backgroundColor = UIColor.clear
        labelTitle.textAlignment = NSTextAlignment.center
        labelTitle.font = UIFont.game(size:14)
        labelTitle.numberOfLines = 0
        self.labelTitle = labelTitle
        
        let imageView:UIImageView = UIImageView()
        imageView.isUserInteractionEnabled = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = UIViewContentMode.center
        imageView.clipsToBounds = true
        self.imageView = imageView
        
        addSubview(imageView)
        addSubview(labelTitle)
        
        NSLayoutConstraint.bottomToBottom(
            view:labelTitle,
            toView:self)
        NSLayoutConstraint.height(
            view:labelTitle,
            constant:kTitleHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:labelTitle,
            toView:self,
            margin:kTitleMargin)
        
        NSLayoutConstraint.topToTop(
            view:imageView,
            toView:self)
        NSLayoutConstraint.bottomToBottom(
            view:imageView,
            toView:self,
            constant:kImageBottom)
        NSLayoutConstraint.equalsHorizontal(
            view:imageView,
            toView:self)
    }
    
    required init?(coder:NSCoder)
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
            alpha = kAlphaSelected
        }
        else
        {
            alpha = kAlphaNotSelected
        }
    }
    
    //MARK: public
    
    func config(model:MHomeOptions)
    {
        if model.available
        {
            labelTitle.textColor = UIColor.colourSuccess
            backgroundColor = UIColor.black
        }
        else
        {
            labelTitle.textColor = UIColor(white:0.6, alpha:1)
            backgroundColor = UIColor(white:0, alpha:0.4)
        }

        imageView.image = model.thumbnail
        labelTitle.text = model.title
        
        hover()
    }
}
