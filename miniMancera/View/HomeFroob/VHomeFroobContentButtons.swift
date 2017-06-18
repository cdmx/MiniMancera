import UIKit

class VHomeFroobContentButtons:UIView
{
    private weak var controller:CHomeFroob!
    private let kButtonMargin:CGFloat = 1
    private let kButtonWidth:CGFloat = 148
    
    convenience init(controller:CHomeFroob)
    {
        self.init()
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor(white:0.88, alpha:1)
        self.controller = controller
        
        let buttonStore:UIButton = UIButton()
        buttonStore.translatesAutoresizingMaskIntoConstraints = false
        buttonStore.clipsToBounds = true
        buttonStore.backgroundColor = UIColor.white
        buttonStore.setTitle(
            String.localized(key:"VHomeFroobContentButtons_buttonStore"),
            for:UIControlState.normal)
        buttonStore.setTitleColor(
            UIColor.colourSuccess,
            for:UIControlState.normal)
        buttonStore.setTitleColor(
            UIColor(white:0, alpha:0.1),
            for:UIControlState.highlighted)
        buttonStore.titleLabel!.font = UIFont.bold(size:15)
        buttonStore.addTarget(
            self,
            action:#selector(actionStore(sender:)),
            for:UIControlEvents.touchUpInside)
        
        let buttonCancel:UIButton = UIButton()
        buttonCancel.translatesAutoresizingMaskIntoConstraints = false
        buttonCancel.clipsToBounds = true
        buttonCancel.backgroundColor = UIColor.white
        buttonCancel.setTitle(
            String.localized(key:"VHomeFroobContentButtons_buttonCancel"),
            for:UIControlState.normal)
        buttonCancel.setTitleColor(
            UIColor(white:0.7, alpha:1),
            for:UIControlState.normal)
        buttonCancel.setTitleColor(
            UIColor(white:0, alpha:0.1),
            for:UIControlState.highlighted)
        buttonCancel.titleLabel!.font = UIFont.bold(size:15)
        buttonCancel.addTarget(
            self,
            action:#selector(self.actionCancel(sender:)),
            for:UIControlEvents.touchUpInside)
        
        addSubview(buttonStore)
        addSubview(buttonCancel)
        
        NSLayoutConstraint.topToTop(
            view:buttonCancel,
            toView:self,
            constant:kButtonMargin)
        NSLayoutConstraint.bottomToBottom(
            view:buttonCancel,
            toView:self)
        NSLayoutConstraint.leftToLeft(
            view:buttonCancel,
            toView:self,
            constant:kButtonMargin)
        NSLayoutConstraint.width(
            view:buttonCancel,
            constant:kButtonWidth)
        
        NSLayoutConstraint.topToTop(
            view:buttonStore,
            toView:self,
            constant:kButtonMargin)
        NSLayoutConstraint.bottomToBottom(
            view:buttonStore,
            toView:self)
        NSLayoutConstraint.rightToRight(
            view:buttonStore,
            toView:self,
            constant:-kButtonMargin)
        NSLayoutConstraint.width(
            view:buttonStore,
            constant:kButtonWidth)
    }
    
    //MARK: actions
    
    func actionStore(sender button:UIButton)
    {
        controller.openStore()
    }
    
    func actionCancel(sender button:UIButton)
    {
        controller.back()
    }
}
