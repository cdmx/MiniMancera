import UIKit

class VHomeBar:UIView
{
    private weak var controller:CHome!
    private let kContentTop:CGFloat = 20
    private let kBorderHeight:CGFloat = 1
    private let kNewWidth:CGFloat = 90
    private let kButtonInsets:CGFloat = 30
    
    init(controller:CHome)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
        self.controller = controller
        
        let blur:VBlur = VBlur.light()
        
        let border:VBorder = VBorder(color:UIColor(white:0, alpha:0.2))
        
        let labelTitle:UILabel = UILabel()
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.isUserInteractionEnabled = false
        labelTitle.font = UIFont.bold(size:15)
        labelTitle.textColor = UIColor.black
        labelTitle.textAlignment = NSTextAlignment.center
        labelTitle.backgroundColor = UIColor.clear
        labelTitle.text = NSLocalizedString("VHomeBar_labelTitle", comment:"")
        
        let buttonNew:UIButton = UIButton()
        buttonNew.translatesAutoresizingMaskIntoConstraints = false
        buttonNew.clipsToBounds = true
        buttonNew.backgroundColor = UIColor.clear
        buttonNew.setTitle(
            NSLocalizedString("VHomeBar_buttonNew", comment:""),
            for:UIControlState.normal)
        buttonNew.setTitleColor(
            UIColor.black,
            for:UIControlState.normal)
        buttonNew.setTitleColor(
            UIColor(white:0, alpha:0.2),
            for:UIControlState.highlighted)
        buttonNew.titleLabel!.font = UIFont.regular(size:15)
        buttonNew.titleEdgeInsets = UIEdgeInsets(
            top:0,
            left:kButtonInsets,
            bottom:0,
            right:0)
        buttonNew.addTarget(
            self,
            action:#selector(actionNew(sender:)),
            for:UIControlEvents.touchUpInside)
        
        addSubview(blur)
        addSubview(labelTitle)
        addSubview(border)
        addSubview(buttonNew)
        
        NSLayoutConstraint.equals(
            view:blur,
            toView:self)
        
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
            view:buttonNew,
            toView:self,
            constant:kContentTop)
        NSLayoutConstraint.bottomToBottom(
            view:buttonNew,
            toView:self)
        NSLayoutConstraint.rightToRight(
            view:buttonNew,
            toView:self)
        NSLayoutConstraint.width(
            view:buttonNew,
            constant:kNewWidth)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: actions
    
    func actionNew(sender button:UIButton)
    {
        controller.newNote()
    }
}
