import UIKit

class ViewParent:UIView
{
    weak var panRecognizer:UIPanGestureRecognizer!
    private weak var controller:ControllerParent!
    private weak var layoutBarTop:NSLayoutConstraint!
    private var panningX:CGFloat?
    private let kAnimationDuration:TimeInterval = 0.25
    private let kBarHeight:CGFloat = 70
    private let kMaxXPanning:CGFloat = 60
    private let kMaxXDelta:CGFloat = 210
    private let kMinXDelta:CGFloat = 30
    
    init(controller:ControllerParent)
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        backgroundColor = UIColor.white
        self.controller = controller
        
        let panRecognizer:UIPanGestureRecognizer = UIPanGestureRecognizer(
            target:self,
            action:#selector(actionPanRecognized(sender:)))
        panRecognizer.isEnabled = false
        self.panRecognizer = panRecognizer
        
        addGestureRecognizer(panRecognizer)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: actions
    
    func actionPanRecognized(sender panGesture:UIPanGestureRecognizer)
    {
        let location:CGPoint = panGesture.location(in:self)
        let xPos:CGFloat = location.x
        
        switch panGesture.state
        {
        case UIGestureRecognizerState.began,
             UIGestureRecognizerState.possible:
            
            if xPos < kMaxXPanning
            {
                self.panningX = xPos
            }
            
            break
            
        case UIGestureRecognizerState.changed:
            
            if let panningX:CGFloat = self.panningX
            {
                var deltaX:CGFloat = xPos - panningX
                
                if deltaX > kMaxXDelta
                {
                    panRecognizer.isEnabled = false
                }
                else
                {
                    if deltaX < 0
                    {
                        deltaX = 0
                    }
                    
                    guard
                        
                        let topView:View = subviews.last as? View
                        
                    else
                    {
                        return
                    }
                    
                    topView.layoutLeft.constant = deltaX
                }
            }
            
            break
            
        case UIGestureRecognizerState.cancelled,
             UIGestureRecognizerState.ended,
             UIGestureRecognizerState.failed:
            
            if let panningX:CGFloat = self.panningX
            {
                let deltaX:CGFloat = xPos - panningX
                
                if deltaX > kMinXDelta
                {
                    gesturePop()
                }
                else
                {
                    gestureRestore()
                }
            }
            
            panningX = nil
            
            break
        }
    }
    
    //MARK: private
    
    private func gesturePop()
    {
        controller.pop(horizontal:ControllerParent.Horizontal.right)
    }
    
    private func gestureRestore()
    {
        guard
            
            let topView:View = subviews.last as? View
            
        else
        {
            return
        }
        
        topView.layoutLeft.constant = 0
        
        UIView.animate(withDuration:kAnimationDuration)
        {
            self.layoutIfNeeded()
        }
    }
    
    //MARK: public
    
    func scrollDidScroll(offsetY:CGFloat)
    {
        let barTopConstant:CGFloat
        
        if offsetY > 0
        {
            barTopConstant = offsetY
        }
        else
        {
            barTopConstant = 0
        }
        
        layoutBarTop.constant = -barTopConstant
    }
    
    func mainView(view:View)
    {
        addSubview(view)
        
        view.layoutTop = NSLayoutConstraint.topToTop(
            view:view,
            toView:self)
        view.layoutBottom = NSLayoutConstraint.bottomToBottom(
            view:view,
            toView:self)
        view.layoutLeft = NSLayoutConstraint.leftToLeft(
            view:view,
            toView:self)
        view.layoutRight = NSLayoutConstraint.rightToRight(
            view:view,
            toView:self)
    }
    
    func slide(
        currentView:View,
        newView:View,
        left:CGFloat,
        completion:@escaping(() -> ()))
    {
        addSubview(newView)
        
        newView.layoutTop = NSLayoutConstraint.topToTop(
            view:newView,
            toView:self)
        newView.layoutBottom = NSLayoutConstraint.bottomToBottom(
            view:newView,
            toView:self)
        newView.layoutLeft = NSLayoutConstraint.leftToLeft(
            view:newView,
            toView:self,
            constant:-left)
        newView.layoutRight = NSLayoutConstraint.rightToRight(
            view:newView,
            toView:self,
            constant:-left)
        
        layoutIfNeeded()
        
        currentView.layoutRight.constant = left
        currentView.layoutLeft.constant = left
        newView.layoutRight.constant = 0
        newView.layoutLeft.constant = 0
        
        UIView.animate(
        withDuration:kAnimationDuration,
        animations:
        {
            self.layoutIfNeeded()
        })
        { (done:Bool) in
            
            currentView.removeFromSuperview()
            completion()
        }
    }
    
    func push(
        newView:View,
        left:CGFloat,
        top:CGFloat,
        background:Bool,
        completion:@escaping(() -> ()))
    {
        if background
        {
            let pushBackground:VPushBackground = VPushBackground()
            newView.pushBackground = pushBackground
            
            addSubview(pushBackground)
            
            NSLayoutConstraint.equals(
                view:pushBackground,
                toView:self)
        }
        
        addSubview(newView)
        
        newView.layoutTop = NSLayoutConstraint.topToTop(
            view:newView,
            toView:self,
            constant:top)
        newView.layoutBottom = NSLayoutConstraint.bottomToBottom(
            view:newView,
            toView:self,
            constant:top)
        newView.layoutLeft = NSLayoutConstraint.leftToLeft(
            view:newView,
            toView:self,
            constant:left)
        newView.layoutRight = NSLayoutConstraint.rightToRight(
            view:newView,
            toView:self,
            constant:left)
        
        layoutIfNeeded()
        
        if top >= 0
        {
            newView.layoutTop.constant = 0
            newView.layoutBottom.constant = 0
        }
        else
        {
            newView.layoutBottom.constant = 0
            newView.layoutTop.constant = 0
        }
        
        if left >= 0
        {
            newView.layoutLeft.constant = 0
            newView.layoutRight.constant = 0
        }
        else
        {
            newView.layoutRight.constant = 0
            newView.layoutLeft.constant = 0
        }
        
        UIView.animate(
            withDuration:kAnimationDuration,
            animations:
            {
                self.layoutIfNeeded()
                newView.pushBackground?.alpha = 1
        })
        { (done:Bool) in
            
            completion()
        }
    }
    
    func animateOver(
        newView:View,
        completion:@escaping(() -> ()))
    {
        newView.alpha = 0
        addSubview(newView)
        
        newView.layoutTop = NSLayoutConstraint.topToTop(
            view:newView,
            toView:self)
        newView.layoutBottom = NSLayoutConstraint.bottomToBottom(
            view:newView,
            toView:self)
        newView.layoutLeft = NSLayoutConstraint.leftToLeft(
            view:newView,
            toView:self)
        newView.layoutRight = NSLayoutConstraint.rightToRight(
            view:newView,
            toView:self)
        
        UIView.animate(
            withDuration:kAnimationDuration,
            animations:
            { [weak newView] in
                
                newView?.alpha = 1
            })
        { (done:Bool) in
            
            completion()
        }
    }
    
    func pop(
        currentView:View,
        left:CGFloat,
        top:CGFloat,
        completion:@escaping(() -> ()))
    {
        currentView.layoutTop.constant = top
        currentView.layoutBottom.constant = top
        currentView.layoutRight.constant = left
        currentView.layoutLeft.constant = left
        
        UIView.animate(
            withDuration:kAnimationDuration,
            animations:
            {
                self.layoutIfNeeded()
                currentView.pushBackground?.alpha = 0
        })
        { (done:Bool) in
            
            currentView.pushBackground?.removeFromSuperview()
            currentView.removeFromSuperview()
            completion()
        }
    }
    
    func dismissAnimateOver(
        currentView:View,
        completion:@escaping(() -> ()))
    {
        UIView.animate(
            withDuration:kAnimationDuration,
            animations:
            { [weak currentView] in
                
                currentView?.alpha = 0
            })
        { [weak currentView] (done:Bool) in
            
            currentView?.removeFromSuperview()
            completion()
        }
    }
}
