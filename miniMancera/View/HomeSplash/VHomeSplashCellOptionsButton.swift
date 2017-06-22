import UIKit

class VHomeSplashCellOptionsButton:UIButton
{
    private weak var viewImage:UIImageView!
    private weak var viewTitle:UILabel!
    private let kTitleMargin:CGFloat = 30
    private let kAlphaSelected:CGFloat = 0.3
    private let kAlphaNotSelected:CGFloat = 1
    
    init(
        image:UIImage,
        text:String,
        alignment:NSTextAlignment)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
        
        let viewImage:UIImageView = UIImageView()
        viewImage.isUserInteractionEnabled = false
        viewImage.translatesAutoresizingMaskIntoConstraints = false
        viewImage.clipsToBounds = true
        viewImage.contentMode = UIViewContentMode.center
        viewImage.image = image
        self.viewImage = viewImage
        
        let viewTitle:UILabel = UILabel()
        viewTitle.translatesAutoresizingMaskIntoConstraints = false
        viewTitle.backgroundColor = UIColor.clear
        viewTitle.isUserInteractionEnabled = false
        viewTitle.textAlignment = alignment
        viewTitle.font = UIFont.bold(size:16)
        viewTitle.textColor = UIColor.white
        viewTitle.text = text
        self.viewTitle = viewTitle
        
        addSubview(viewImage)
        addSubview(viewTitle)
        
        NSLayoutConstraint.equals(
            view:viewImage,
            toView:self)
        
        NSLayoutConstraint.equalsVertical(
            view:viewTitle,
            toView:self)
        NSLayoutConstraint.equalsHorizontal(
            view:viewTitle,
            toView:self,
            margin:kTitleMargin)
        
        hover()
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
            viewImage.alpha = kAlphaSelected
        }
        else
        {
            viewImage.alpha = kAlphaNotSelected
        }
    }
}
