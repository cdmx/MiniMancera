import UIKit

class VHomeSplashBackground:UIView
{
    let kHeight:CGFloat = 200
    weak var layoutHeight:NSLayoutConstraint!
    private weak var controller:CHomeSplash!
    private weak var imageView:UIImageView!
    private let kBorderHeight:CGFloat = 1
    
    init(controller:CHomeSplash)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
        isUserInteractionEnabled = false
        self.controller = controller
        
        let imageView:UIImageView = UIImageView()
        imageView.isUserInteractionEnabled = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = UIViewContentMode.center
        imageView.clipsToBounds = true
        imageView.image = controller.model.modelOption.splashImage
        self.imageView = imageView
        
        let border:VBorder = VBorder(color:UIColor.white)
        
        addSubview(imageView)
        addSubview(border)
        
        NSLayoutConstraint.equals(
            view:imageView,
            toView:self)
        
        NSLayoutConstraint.bottomToBottom(
            view:border,
            toView:self)
        NSLayoutConstraint.height(
            view:border,
            constant:kBorderHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:border,
            toView:self)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func layoutSubviews()
    {
        let height:CGFloat = imageView.bounds.maxY
        
        if height > kHeight
        {
            imageView.contentMode = UIViewContentMode.scaleAspectFill
        }
        else
        {
            imageView.contentMode = UIViewContentMode.center
        }
        
        super.layoutSubviews()
    }
}
