import UIKit

class ControllerParent:UIViewController
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
    
    private(set) weak var viewParent:ViewParent!
    private var barHidden:Bool = true
    private var statusBarStyle:UIStatusBarStyle = UIStatusBarStyle.lightContent
    
    init()
    {
        super.init(nibName:nil, bundle:nil)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        let controller:CHome = CHome()
        mainController(controller:controller)
        
        NotificationCenter.default.addObserver(
            self,
            selector:#selector(notifiedEnterForeground(sender:)),
            name:Notification.enterForeground,
            object:nil)
    }
    
    override func loadView()
    {
        let viewParent:ViewParent = ViewParent(controller:self)
        self.viewParent = viewParent
        view = viewParent
    }
    
    override var preferredStatusBarStyle:UIStatusBarStyle
    {
        return statusBarStyle
    }
    
    override var prefersStatusBarHidden:Bool
    {
        return barHidden
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
    
    func hideBar(barHidden:Bool)
    {
        self.barHidden = barHidden
        setNeedsStatusBarAppearanceUpdate()
    }
    
    func statusBarAppareance(statusBarStyle:UIStatusBarStyle)
    {
        self.statusBarStyle = statusBarStyle
        setNeedsStatusBarAppearanceUpdate()
    }
}
