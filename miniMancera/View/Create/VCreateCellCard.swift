import UIKit

class VCreateCellCard:VCreateCell
{
    private weak var viewText:VCreateCellCardText!
    private weak var viewGradient:UIView?
    private let kBorderHeight:CGFloat = 1
    private let kAnimationDuration:TimeInterval = 0.4
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        
        let borderTop:VBorder = VBorder(color:UIColor.black)
        let borderBottom:VBorder = VBorder(color:UIColor.black)
        
        let viewText:VCreateCellCardText = VCreateCellCardText()
        let viewBar:VCreateCellCardBar = VCreateCellCardBar(
        viewText:viewText)
        
        viewText.inputAccessoryView = viewBar
        self.viewText = viewText
        
        addSubview(borderTop)
        addSubview(borderBottom)
        addSubview(viewText)
        
        NSLayoutConstraint.topToTop(
            view:borderTop,
            toView:self)
        NSLayoutConstraint.height(
            view:borderTop,
            constant:kBorderHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:borderTop,
            toView:self)
        
        NSLayoutConstraint.bottomToBottom(
            view:borderBottom,
            toView:self)
        NSLayoutConstraint.height(
            view:borderBottom,
            constant:kBorderHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:borderBottom,
            toView:self)
        
        NSLayoutConstraint.equals(
            view:viewText,
            toView:self)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func config(controller:CCreate)
    {
        super.config(controller:controller)
        viewText.config(model:controller.model)
        
        addGradient()
    }
    
    //MARK: private
    
    private func addGradient()
    {
        self.viewGradient?.removeFromSuperview()
     
        guard
        
            let backgroundModel:MCreateBackgroundProtocol = controller?.model.selectedBackgroundModel()
        
        else
        {
            return
        }
        
        let viewGradient:UIView = backgroundModel.view()
        viewGradient.alpha = 0
        self.viewGradient = viewGradient
        
        insertSubview(viewGradient, at:0)
        
        NSLayoutConstraint.equals(
            view:viewGradient,
            toView:self)
        
        UIView.animate(withDuration:kAnimationDuration)
        { [weak self] in
            
            self?.viewGradient?.alpha = 1
        }
    }
}
