import UIKit

class VCreateBar:UIView
{
    private weak var controller:CCreate!
    private let kBorderHeight:CGFloat = 1
    private let kContentTop:CGFloat = 20
    private let kCancelWidth:CGFloat = 90
    private let kDoneWidth:CGFloat = 90
    private let kButtonInsets:CGFloat = 25
    
    init(controller:CCreate)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.white
        translatesAutoresizingMaskIntoConstraints = false
        self.controller = controller
        
        let border:VBorder = VBorder(color:UIColor(white:0, alpha:0.2))
        
        let labelTitle:UILabel = UILabel()
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.backgroundColor = UIColor.clear
        labelTitle.textAlignment = NSTextAlignment.center
        labelTitle.font = UIFont.bold(size:15)
        labelTitle.textColor = UIColor.black
        labelTitle.isUserInteractionEnabled = false
        
        if let _:MHomeItem = controller.modelHomeItem
        {
            labelTitle.text = NSLocalizedString("VCreateBar_labelTitleEdit", comment:"")
        }
        else
        {
            labelTitle.text = NSLocalizedString("VCreateBar_labelTitle", comment:"")
        }
        
        let buttonCancel:UIButton = UIButton()
        buttonCancel.translatesAutoresizingMaskIntoConstraints = false
        buttonCancel.setTitle(
            NSLocalizedString("VCreateBar_buttonCancel", comment:""),
            for:UIControlState.normal)
        buttonCancel.setTitleColor(
            UIColor.black,
            for:UIControlState.normal)
        buttonCancel.setTitleColor(
            UIColor(white:0, alpha:0.2),
            for:UIControlState.highlighted)
        buttonCancel.titleLabel!.font = UIFont.regular(size:15)
        buttonCancel.titleEdgeInsets = UIEdgeInsets(
            top:0,
            left:0,
            bottom:0,
            right:kButtonInsets)
        buttonCancel.addTarget(
            self,
            action:#selector(actionCancel(sender:)),
            for:UIControlEvents.touchUpInside)
        
        let buttonDone:UIButton = UIButton()
        buttonDone.translatesAutoresizingMaskIntoConstraints = false
        buttonDone.setTitle(
            NSLocalizedString("VCreateBar_buttonDone", comment:""),
            for:UIControlState.normal)
        buttonDone.setTitleColor(
            UIColor.black,
            for:UIControlState.normal)
        buttonDone.setTitleColor(
            UIColor(white:0, alpha:0.2),
            for:UIControlState.highlighted)
        buttonDone.titleLabel!.font = UIFont.regular(size:15)
        buttonDone.titleEdgeInsets = UIEdgeInsets(
            top:0,
            left:kButtonInsets,
            bottom:0,
            right:0)
        buttonDone.addTarget(
            self,
            action:#selector(actionDone(sender:)),
            for:UIControlEvents.touchUpInside)
        
        addSubview(border)
        addSubview(labelTitle)
        addSubview(buttonCancel)
        addSubview(buttonDone)
        
        NSLayoutConstraint.bottomToBottom(
            view:border,
            toView:self)
        NSLayoutConstraint.height(
            view:border,
            constant:kBorderHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:border,
            toView:self)
        
        NSLayoutConstraint.topToTop(
            view:buttonCancel,
            toView:self,
            constant:kContentTop)
        NSLayoutConstraint.bottomToBottom(
            view:buttonCancel,
            toView:self)
        NSLayoutConstraint.leftToLeft(
            view:buttonCancel,
            toView:self)
        NSLayoutConstraint.width(
            view:buttonCancel,
            constant:kCancelWidth)
        
        NSLayoutConstraint.topToTop(
            view:buttonDone,
            toView:self,
            constant:kContentTop)
        NSLayoutConstraint.bottomToBottom(
            view:buttonDone,
            toView:self)
        NSLayoutConstraint.rightToRight(
            view:buttonDone,
            toView:self)
        NSLayoutConstraint.width(
            view:buttonDone,
            constant:kDoneWidth)
        
        NSLayoutConstraint.topToTop(
            view:labelTitle,
            toView:self,
            constant:kContentTop)
        NSLayoutConstraint.bottomToBottom(
            view:labelTitle,
            toView:self)
        NSLayoutConstraint.equalsHorizontal(
            view:labelTitle,
            toView:self)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: actions
    
    func actionCancel(sender button:UIButton)
    {
        UIApplication.shared.keyWindow!.endEditing(true)
        
        controller.cancel()
    }
    
    func actionDone(sender button:UIButton)
    {
        UIApplication.shared.keyWindow!.endEditing(true)
        
        controller.done()
    }
}
