import UIKit

class VHomeSplashCellOptionsButton:UIButton
{
    private let kTitleMargin:CGFloat = 30
    
    init(
        image:UIImage,
        text:String,
        alignment:NSTextAlignment)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
        
        let imageView:UIImageView = UIImageView()
        imageView.isUserInteractionEnabled = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.contentMode = UIViewContentMode.center
        imageView.image = image
        
        let titleLabel:UILabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.backgroundColor = UIColor.clear
        titleLabel.isUserInteractionEnabled = false
        titleLabel.textAlignment = alignment
        titleLabel.font = UIFont.bold(size:16)
        titleLabel.textColor = UIColor.white
        titleLabel.text = text
        
        addSubview(imageView)
        addSubview(titleLabel)
        
        NSLayoutConstraint.equals(
            view:imageView,
            toView:self)
        
        NSLayoutConstraint.equalsVertical(
            view:titleLabel,
            toView:self)
        NSLayoutConstraint.equalsHorizontal(
            view:titleLabel,
            toView:self,
            margin:kTitleMargin)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
