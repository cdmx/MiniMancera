import UIKit

class VHomeFroobContentHeader:UIView
{
    init(controller:CHomeFroob)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
        isUserInteractionEnabled = false
        
        let viewGradient:VGradient = VGradient.diagonal(
            colorLeftBottom:UIColor.colourSuccess,
            colorTopRight:UIColor.colourFail)
        
        addSubview(viewGradient)
        
        NSLayoutConstraint.equals(
            view:viewGradient,
            toView:self)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
