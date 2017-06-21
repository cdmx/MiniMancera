import UIKit

class VHomeFroobContentActions:UIView
{
    private weak var controller:CHomeFroob!
    private let kButtonHeight:CGFloat = 45
    private let kButtonMargin:CGFloat = 20
    
    init(controller:CHomeFroob)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        translatesAutoresizingMaskIntoConstraints = false
        self.controller = controller
        
        let buttonStore:VHomeFroobContentActionsStore = VHomeFroobContentActionsStore(
            controller:controller)
        
        let buttonCancel:UIButton = UIButton()
        buttonCancel.translatesAutoresizingMaskIntoConstraints = false
        buttonCancel.backgroundColor = UIColor.clear
        buttonCancel.setTitleColor(
            UIColor(white:1, alpha:0.6),
            for:UIControlState.normal)
        buttonCancel.setTitleColor(
            UIColor(white:1, alpha:0.2),
            for:UIControlState.highlighted)
        buttonCancel.setTitle(
            String.localized(key:"VHomeFroobContentActions_buttonCancel"),
            for:UIControlState.normal)
        buttonCancel.titleLabel!.font = UIFont.bold(size:16)
        buttonCancel.addTarget(
            self,
            action:#selector(actionCancel(sender:)),
            for:UIControlEvents.touchUpInside)
        
        addSubview(buttonStore)
        addSubview(buttonCancel)
        
        NSLayoutConstraint.topToTop(
            view:buttonStore,
            toView:self,
            constant:kButtonMargin)
        NSLayoutConstraint.height(
            view:buttonStore,
            constant:kButtonHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:buttonStore,
            toView:self,
            margin:kButtonMargin)
        
        NSLayoutConstraint.topToBottom(
            view:buttonCancel,
            toView:buttonStore,
            constant:kButtonMargin)
        NSLayoutConstraint.height(
            view:buttonCancel,
            constant:kButtonHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:buttonCancel,
            toView:self,
            margin:kButtonMargin)
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
