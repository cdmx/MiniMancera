import UIKit

class VHomeFroob:View
{
    private weak var layoutContentTop:NSLayoutConstraint!
    private let kAnimationFirstDuration:TimeInterval = 0.25
    private let kAnimationSecondDuration:TimeInterval = 0.1
    private let kMarginHorizontal:CGFloat = 10
    private let kMarginVertical:CGFloat = 20
    
    required init(controller:UIViewController)
    {
        super.init(controller:controller)
        backgroundColor = UIColor.clear
        
        guard
            
            let controller:CHomeFroob = controller as? CHomeFroob
        
        else
        {
            return
        }
        
        let screenSize:CGSize = UIScreen.main.bounds.size
        let width:CGFloat = screenSize.width
        let height:CGFloat = screenSize.height
        let marginHoriontal2:CGFloat = kMarginHorizontal + kMarginHorizontal
        let marginVertical2:CGFloat = kMarginVertical + kMarginVertical
        let usableWidth:CGFloat = width - marginHoriontal2
        let usableHeight:CGFloat = height - marginVertical2
        
        let blur:VBlur = VBlur.light()
        
        let baseButton:UIButton = UIButton()
        baseButton.clipsToBounds = true
        baseButton.backgroundColor = UIColor.clear
        baseButton.translatesAutoresizingMaskIntoConstraints = false
        baseButton.addTarget(
            self,
            action:#selector(self.actionClose(sender:)),
            for:UIControlEvents.touchUpInside)
        
        let viewContent:VHomeFroobContent = VHomeFroobContent(
            controller:controller)
        
        addSubview(blur)
        addSubview(baseButton)
        addSubview(viewContent)
        
        NSLayoutConstraint.equals(
            view:blur,
            toView:self)
        NSLayoutConstraint.equals(
            view:baseButton,
            toView:self)
        
        layoutContentTop = NSLayoutConstraint.topToTop(
            view:viewContent,
            toView:self,
            constant:-usableHeight)
        NSLayoutConstraint.height(
            view:viewContent,
            constant:usableHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:viewContent,
            toView:self,
            margin:kMarginHorizontal)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: actions
    
    func actionClose(sender button:UIButton)
    {
        guard
            
            let controller:CHomeFroob = self.controller as? CHomeFroob
        
        else
        {
            return
        }
        
        controller.back()
    }
    
    //MARK: public
    
    func animateShow()
    {
        layoutContentTop.constant = kMarginVertical + kMarginVertical
        
        UIView.animate(withDuration:kAnimationFirstDuration,
                       animations:
        { [weak self] in
            
                self?.layoutIfNeeded()
        })
        { [weak self] (done:Bool) in
            
            guard
            
                let strongSelf:VHomeFroob = self
            
            else
            {
                return
            }
            
            strongSelf.layoutContentTop.constant = strongSelf.kMarginVertical
            
            UIView.animate(withDuration:strongSelf.kAnimationSecondDuration)
            { [weak self] in
                
                self?.layoutIfNeeded()
            }
        }
    }
}
