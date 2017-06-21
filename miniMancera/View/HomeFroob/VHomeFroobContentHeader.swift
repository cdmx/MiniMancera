import UIKit

class VHomeFroobContentHeader:UIView
{
    private weak var controller:CHomeFroob!
    
    init(controller:CHomeFroob)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
        isUserInteractionEnabled = false
        self.controller = controller
        
        let viewGradient:VGradient = VGradient.diagonal(
            colorLeftBottom:UIColor.colourSuccess,
            colorTopRight:UIColor.colourFail)
        
        let viewCircle:UIImageView = UIImageView()
        viewCircle.isUserInteractionEnabled = false
        viewCircle.translatesAutoresizingMaskIntoConstraints = false
        viewCircle.clipsToBounds = true
        viewCircle.contentMode = UIViewContentMode.center
        viewCircle.image = #imageLiteral(resourceName: "assetGenericCircle")
        
        let imageView:UIImageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.contentMode = UIViewContentMode.center
        imageView.isUserInteractionEnabled = false
        imageView.image = controller.option.thumbnail
        
        addSubview(viewGradient)
        addSubview(viewCircle)
        addSubview(imageView)
        
        NSLayoutConstraint.equals(
            view:viewGradient,
            toView:self)
        
        NSLayoutConstraint.equals(
            view:viewCircle,
            toView:self)
        
        NSLayoutConstraint.equals(
            view:imageView,
            toView:self)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
