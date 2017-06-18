import UIKit

class VHomeOptionsCell:UICollectionViewCell
{
    private weak var imageView:UIImageView!
    private weak var labelTitle:UILabel!
    private let kAlphaSelected:CGFloat = 0.4
    private let kAlphaNotSelected:CGFloat = 1
    private let kBorderWidth:CGFloat = 1
    private let kTitleMargin:CGFloat = 3
    private let kTitleHeight:CGFloat = 70
    private let kImageHeight:CGFloat = 100
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        layer.borderWidth = kBorderWidth
        
        let labelTitle:UILabel = UILabel()
        labelTitle.isUserInteractionEnabled = false
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.backgroundColor = UIColor.clear
        labelTitle.textAlignment = NSTextAlignment.center
        labelTitle.font = UIFont.regular(size:16)
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
        NSLayoutConstraint.height(
            view:imageView,
            constant:kImageHeight)
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
    
    func config(model:MHomeOptionsProtocol)
    {
        if model.available
        {
            labelTitle.textColor = UIColor.colourSuccess
            layer.borderColor = UIColor.colourSuccess.cgColor
        }
        else
        {
            labelTitle.textColor = UIColor.colourFail
            layer.borderColor = UIColor.colourFail.cgColor
        }

        imageView.image = model.thumbnail
        labelTitle.text = model.title
        
        hover()
    }
}
