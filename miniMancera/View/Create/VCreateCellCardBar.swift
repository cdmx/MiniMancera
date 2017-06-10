import UIKit

class VCreateCellCardBar:UIView
{
    private weak var viewText:VCreateCellCardText?
    private let kButtonHorizontalMargin:CGFloat = 10
    private let kButtonWidth:CGFloat = 90
    private let kButtonVerticalMargin:CGFloat = 10
    private let kButtonCornerRadius:CGFloat = 7
    private let kHeight:CGFloat = 48
    private let kBorderHeight:CGFloat = 1
    
    init(viewText:VCreateCellCardText)
    {
        let rect:CGRect = CGRect(x:0, y:0, width:0, height:kHeight)
        
        super.init(frame:rect)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        self.viewText = viewText

        let blur:VBlur = VBlur.extraLight()
        let border:VBorder = VBorder(color:UIColor(white:0, alpha:0.6))
        
        let buttonDone:UIButton = UIButton()
        buttonDone.translatesAutoresizingMaskIntoConstraints = false
        buttonDone.backgroundColor = UIColor.punkPurple
        buttonDone.clipsToBounds = true
        buttonDone.setTitle(
            NSLocalizedString("VCreateCellCardBar_titleButtonDone", comment:""),
            for:UIControlState.normal)
        buttonDone.setTitleColor(
            UIColor.white,
            for:UIControlState.normal)
        buttonDone.setTitleColor(
            UIColor(white:1, alpha:0.2),
            for:UIControlState.highlighted)
        buttonDone.titleLabel!.font = UIFont.bold(size:13)
        buttonDone.layer.cornerRadius = kButtonCornerRadius
        buttonDone.addTarget(
            self,
            action:#selector(actionButtonDone(sender:)),
            for:UIControlEvents.touchUpInside)
        
        let buttonClear:UIButton = UIButton()
        buttonClear.translatesAutoresizingMaskIntoConstraints = false
        buttonClear.backgroundColor = UIColor.punkOrange
        buttonClear.clipsToBounds = true
        buttonClear.setTitle(
            NSLocalizedString("VCreateCellCardBar_titleButtonClear", comment:""),
            for:UIControlState.normal)
        buttonClear.setTitleColor(
            UIColor.white,
            for:UIControlState.normal)
        buttonClear.setTitleColor(
            UIColor(white:1, alpha:0.2),
            for:UIControlState.highlighted)
        buttonClear.titleLabel!.font = UIFont.bold(size:13)
        buttonClear.layer.cornerRadius = kButtonCornerRadius
        buttonClear.addTarget(
            self,
            action:#selector(actionButtonClear(sender:)),
            for:UIControlEvents.touchUpInside)
        
        addSubview(blur)
        addSubview(border)
        addSubview(buttonClear)
        addSubview(buttonDone)
        
        NSLayoutConstraint.equalsVertical(
            view:buttonDone,
            toView:self,
            margin:kButtonVerticalMargin)
        NSLayoutConstraint.rightToRight(
            view:buttonDone,
            toView:self,
            constant:-kButtonHorizontalMargin)
        NSLayoutConstraint.width(
            view:buttonDone,
            constant:kButtonWidth)
        
        NSLayoutConstraint.equalsVertical(
            view:buttonClear,
            toView:self,
            margin:kButtonVerticalMargin)
        NSLayoutConstraint.leftToLeft(
            view:buttonClear,
            toView:self,
            constant:kButtonHorizontalMargin)
        NSLayoutConstraint.width(
            view:buttonClear,
            constant:kButtonWidth)
        
        NSLayoutConstraint.topToTop(
            view:border,
            toView:self)
        NSLayoutConstraint.height(
            view:border,
            constant:kBorderHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:border,
            toView:self)
        
        NSLayoutConstraint.equals(
            view:blur,
            toView:self)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: actions
    
    func actionButtonDone(sender button:UIButton)
    {
        UIApplication.shared.keyWindow!.endEditing(true)
    }
    
    func actionButtonClear(sender button:UIButton)
    {
        viewText?.clear()
    }
}
