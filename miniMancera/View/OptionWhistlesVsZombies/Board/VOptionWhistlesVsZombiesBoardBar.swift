import UIKit

class VOptionWhistlesVsZombiesBoardBar:UIView
{
    private weak var controller:COptionWhistlesVsZombiesBoard!
    private let kCancelWidth:CGFloat = 100
    
    init(controller:COptionWhistlesVsZombiesBoard)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
        self.controller = controller
        
        let buttonCancel:UIButton = UIButton()
        buttonCancel.setImage(
            #imageLiteral(resourceName: "assetWhistlesVsZombiesWhistleBoardCancel"),
            for:UIControlState.normal)
        buttonCancel.imageView!.clipsToBounds = true
        buttonCancel.imageView!.contentMode = UIViewContentMode.center
        buttonCancel.addTarget(
            self,
            action:#selector(actionCancel(sender:)),
            for:UIControlEvents.touchUpInside)
        
        addSubview(buttonCancel)
        
        NSLayoutConstraint.equalsVertical(
            view:buttonCancel,
            toView:self)
        NSLayoutConstraint.rightToRight(
            view:buttonCancel,
            toView:self)
        NSLayoutConstraint.width(
            view:buttonCancel,
            constant:kCancelWidth)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: actions
    
    func actionCancel(sender button:UIButton)
    {
        controller.back()
    }
}
