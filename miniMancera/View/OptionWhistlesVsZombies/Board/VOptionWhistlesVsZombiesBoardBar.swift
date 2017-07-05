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
        
        let labelTitle:UILabel = UILabel()
        labelTitle.isUserInteractionEnabled = false
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.backgroundColor = UIColor.clear
        labelTitle.textAlignment = NSTextAlignment.center
        labelTitle.textColor = UIColor.white
        labelTitle.font = UIFont.game(size:14)
        labelTitle.text = String.localizedWhistlesVsZombies(
            key:"VOptionWhistlesVsZombiesBoardBar_labelTitle")
        
        let buttonCancel:UIButton = UIButton()
        buttonCancel.clipsToBounds = true
        buttonCancel.translatesAutoresizingMaskIntoConstraints = false
        buttonCancel.setImage(
            #imageLiteral(resourceName: "assetWhistlesVsZombiesWhistleBoardCancel"),
            for:UIControlState.normal)
        buttonCancel.imageView!.clipsToBounds = true
        buttonCancel.imageView!.contentMode = UIViewContentMode.center
        buttonCancel.addTarget(
            self,
            action:#selector(actionCancel(sender:)),
            for:UIControlEvents.touchUpInside)
        
        addSubview(labelTitle)
        addSubview(buttonCancel)
        
        NSLayoutConstraint.equals(
            view:labelTitle,
            toView:self)
        
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
