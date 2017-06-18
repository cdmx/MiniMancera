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
        let viewOptions:VHomeSplashOptions = VHomeSplashOptions(controller:controller)
        let viewFooter:VHomeSplashFooter = VHomeSplashFooter(controller:controller)
        
        addSubview(viewImage)
        addSubview(viewOptions)
        addSubview(viewFooter)
        
        NSLayoutConstraint.topToTop(
            view:viewImage,
            toView:self)
        NSLayoutConstraint.height(
            view:viewImage,
            constant:kImageHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:viewImage,
            toView:self)
        
        NSLayoutConstraint.topToBottom(
            view:viewOptions,
            toView:viewImage)
        NSLayoutConstraint.height(
            view:viewOptions,
            constant:kOptionsHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:viewOptions,
            toView:self)
        
        NSLayoutConstraint.topToBottom(
            view:viewFooter,
            toView:viewOptions)
        NSLayoutConstraint.bottomToBottom(
            view:viewFooter,
            toView:self)
        NSLayoutConstraint.equalsHorizontal(
            view:viewFooter,
            toView:self)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
