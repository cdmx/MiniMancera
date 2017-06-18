import UIKit

class VHomeSplashOptions:UIView
{
    private weak var controller:CHomeSplash!
    
    init(controller:CHomeSplash)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
        self.controller = controller
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
