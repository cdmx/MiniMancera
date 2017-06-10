import UIKit

class VPushBackground:UIView
{
    init()
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor(white:0, alpha:0.2)
        translatesAutoresizingMaskIntoConstraints = false
        alpha = 0
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
