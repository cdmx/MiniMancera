import UIKit

class ControllerParent:UIViewController
{
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
    
    deinit
    {
        NotificationCenter.default.removeObserver(self)
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
