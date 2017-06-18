import UIKit

class VHomeSplash:View
{
    private let kImageHeight:CGFloat = 200
    private let kOptionsHeight:CGFloat = 80
    
    required init(controller:UIViewController)
    {
        super.init(controller:controller)
        
        guard
        
            let controller:CHomeSplash = controller as? CHomeSplash
        
        else
        {
            return
        }
        
        let viewImage:VHomeSplashImage = VHomeSplashImage(controller:controller)
        
        addSubview(viewImage)
        
        NSLayoutConstraint.topToTop(
            view:viewImage,
            toView:self)
        NSLayoutConstraint.height(
            view:viewImage,
            constant:kImageHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:viewImage,
            toView:self)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
