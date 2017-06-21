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
