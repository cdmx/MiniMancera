import UIKit

class VHomeHeader:UIView
{
    private weak var controller:CHome!
    
    init(controller:CHome)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
        isHidden = true
        self.controller = controller
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
