import UIKit

extension ControllerParent
{
    enum Vertical:CGFloat
    {
        case top = -1
        case bottom = 1
        case none = 0
    }
    
    enum Horizontal:CGFloat
    {
        case left = -1
        case right = 1
        case none = 0
    }
    
    //MARK: private
    
    private func slide(controller:UIViewController, left:CGFloat)
    {
        guard
            
            let currentController:UIViewController = childViewControllers.last,
            let newView:View = controller.view as? View,
            let currentView:View = currentController.view as? View
            
        else
        {
            return
        }
        
        addChildViewController(controller)
        controller.beginAppearanceTransition(true, animated:true)
        currentController.beginAppearanceTransition(false, animated:true)
        
        viewParent.slide(
            currentView:currentView,
            newView:newView,
            left:left)
        {
            controller.endAppearanceTransition()
            currentController.endAppearanceTransition()
            currentController.removeFromParentViewController()
        }
    }
    
    //MARK: public
    
    func slideTo(horizontal:Horizontal, controller:UIViewController)
    {
        let left:CGFloat = -viewParent.bounds.maxX * horizontal.rawValue
        slide(controller:controller, left:left)
    }
    
    func mainController(controller:UIViewController)
    {
        addChildViewController(controller)
        
        guard
            
            let newView:View = controller.view as? View
            
        else
        {
            return
        }
        
        viewParent.mainView(view:newView)
    }
    
    func push(
        controller:UIViewController,
        horizontal:Horizontal = Horizontal.none,
        vertical:Vertical = Vertical.none,
        background:Bool = true,
        completion:(() -> ())? = nil)
    {
        let width:CGFloat = viewParent.bounds.maxX
        let height:CGFloat = viewParent.bounds.maxY
        let left:CGFloat = width * horizontal.rawValue
        let top:CGFloat = height * vertical.rawValue
        
        guard
            
            let currentController:UIViewController = childViewControllers.last,
            let newView:View = controller.view as? View
            
        else
        {
            return
        }
        
        addChildViewController(controller)
        controller.beginAppearanceTransition(true, animated:true)
        currentController.beginAppearanceTransition(false, animated:true)
        viewParent.panRecognizer.isEnabled = true
        
        viewParent.push(
            newView:newView,
            left:left,
            top:top,
            background:background)
        {
            controller.endAppearanceTransition()
            currentController.endAppearanceTransition()
            completion?()
        }
    }
    
    func animateOver(controller:UIViewController)
    {
        guard
            
            let currentController:UIViewController = childViewControllers.last,
            let newView:View = controller.view as? View
            
        else
        {
            return
        }
        
        addChildViewController(controller)
        controller.beginAppearanceTransition(true, animated:true)
        currentController.beginAppearanceTransition(false, animated:true)
        
        viewParent.animateOver(
            newView:newView)
        {
            controller.endAppearanceTransition()
            currentController.endAppearanceTransition()
        }
    }
    
    func removeBetweenFirstAndLast()
    {
        var controllers:Int = childViewControllers.count - 1
        
        while controllers > 1
        {
            controllers -= 1
            
            let controller:UIViewController = childViewControllers[controllers]
            
            guard
                
                let view:View = controller.view as? View
                
            else
            {
                continue
            }
            
            controller.beginAppearanceTransition(false, animated:false)
            view.removeFromSuperview()
            controller.endAppearanceTransition()
            controller.removeFromParentViewController()
        }
    }
    
    func removeAllButLast()
    {
        var controllers:Int = childViewControllers.count - 1
        
        while controllers > 0
        {
            controllers -= 1
            
            let controller:UIViewController = childViewControllers[controllers]
            
            guard
                
                let view:View = controller.view as? View
                
            else
            {
                continue
            }
            
            controller.beginAppearanceTransition(false, animated:false)
            view.removeFromSuperview()
            controller.endAppearanceTransition()
            controller.removeFromParentViewController()
        }
    }
    
    func pop(
        horizontal:Horizontal = Horizontal.none,
        vertical:Vertical = Vertical.none,
        completion:(() -> ())? = nil)
    {
        let width:CGFloat = viewParent.bounds.maxX
        let height:CGFloat = viewParent.bounds.maxY
        let left:CGFloat = width * horizontal.rawValue
        let top:CGFloat = height * vertical.rawValue
        let controllers:Int = childViewControllers.count
        
        if controllers > 1
        {
            let currentController:UIViewController = childViewControllers[controllers - 1]
            let previousController:UIViewController = childViewControllers[controllers - 2]
            
            guard
                
                let currentView:View = currentController.view as? View
                
            else
            {
                return
            }
            
            currentController.beginAppearanceTransition(false, animated:true)
            previousController.beginAppearanceTransition(true, animated:true)
            
            viewParent.pop(
                currentView:currentView,
                left:left,
                top:top)
            {
                previousController.endAppearanceTransition()
                currentController.endAppearanceTransition()
                currentController.removeFromParentViewController()
                
                completion?()
                
                if self.childViewControllers.count > 1
                {
                    self.viewParent.panRecognizer.isEnabled = true
                }
                else
                {
                    self.viewParent.panRecognizer.isEnabled = false
                }
            }
        }
    }
    
    func popSilent(removeIndex:Int)
    {
        let controllers:Int = childViewControllers.count
        
        if controllers > removeIndex
        {
            let removeController:UIViewController = childViewControllers[removeIndex]
            
            guard
                
                let removeView:View = removeController.view as? View
                
            else
            {
                return
            }
            
            removeView.pushBackground?.removeFromSuperview()
            removeView.removeFromSuperview()
            removeController.removeFromParentViewController()
            
            if childViewControllers.count < 2
            {
                self.viewParent.panRecognizer.isEnabled = false
            }
        }
    }
    
    func dismissAnimateOver(completion:(() -> ())?)
    {
        guard
            
            let currentController:UIViewController = childViewControllers.last,
            let currentView:View = currentController.view as? View
            
        else
        {
            return
        }
        
        currentController.removeFromParentViewController()
        
        guard
            
            let previousController:UIViewController = childViewControllers.last
            
        else
        {
            return
        }
        
        currentController.beginAppearanceTransition(false, animated:true)
        previousController.beginAppearanceTransition(true, animated:true)
        
        viewParent.dismissAnimateOver(
            currentView:currentView)
        {
            currentController.endAppearanceTransition()
            previousController.endAppearanceTransition()
            
            completion?()
        }
    }
}
