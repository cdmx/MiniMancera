import UIKit

class VHomeSplashCellOptionsButton:UIButton
{
    init(image:UIImage, text:String)
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
        titleLabel.textAlignment = NSTextAlignment.center
        titleLabel.font = UIFont.bold(size:16)
        titleLabel.textColor = UIColor.white
        titleLabel.text = text
        
        addSubview(imageView)
        addSubview(titleLabel)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
