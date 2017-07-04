import UIKit

class VOptionWhistlesVsZombiesBoard:View
{
    private let kBarHeight:CGFloat = 100
    
    required init(controller:UIViewController)
    {
        super.init(controller:controller)
        backgroundColor = UIColor.clear
        
        guard
            
            let controller:COptionWhistlesVsZombiesBoard = self.controller as? COptionWhistlesVsZombiesBoard
        
        else
        {
            return
        }
        
        let blur:VBlur = VBlur.dark()
        
        let bar:VOptionWhistlesVsZombiesBoardBar = VOptionWhistlesVsZombiesBoardBar(
            controller:controller)
        
        addSubview(blur)
        addSubview(bar)
        
        NSLayoutConstraint.equals(
            view:blur,
            toView:self)
        
        NSLayoutConstraint.topToTop(
            view:bar,
            toView:self)
        NSLayoutConstraint.height(
            view:bar,
            constant:kBarHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:bar,
            toView:self)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
