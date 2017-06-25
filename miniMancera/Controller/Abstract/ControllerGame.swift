import SpriteKit

class ControllerGame:UIViewController, SKSceneDelegate
{
    let model:MGame
    let playSounds:Bool
    private(set) weak var dataOption:DOption?
    private(set) var lastUpdateTime:TimeInterval?
    private(set) var elapsedTime:TimeInterval
    
    init(model:MGame, dataOption:DOption)
    {
        self.model = model
        self.dataOption = dataOption
        
        if let playSounds:Bool = MSession.sharedInstance.settings?.sounds
        {
            self.playSounds = playSounds
        }
        else
        {
            playSounds = true
        }
        
        elapsedTime = 0
        
        super.init(nibName:nil, bundle:nil)
    }
    
    required init?(dataOption:DOption)
    {
        return nil
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    deinit
    {
        NotificationCenter.default.removeObserver(self)
    }
    
    override var preferredStatusBarStyle:UIStatusBarStyle
    {
        return UIStatusBarStyle.lightContent
    }
    
    override var prefersStatusBarHidden:Bool
    {
        return true
    }
    
    override func loadView()
    {
        let view:ViewGame = ViewGame(controller:self)
        self.view = view
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        edgesForExtendedLayout = UIRectEdge()
        extendedLayoutIncludesOpaqueBars = false
        automaticallyAdjustsScrollViewInsets = false
        
        NotificationCenter.default.addObserver(
            self,
            selector:#selector(notifiedEnterBackground(sender:)),
            name:Notification.enterBackground,
            object:nil)
    }
    
    //MARK: notified
    
    func notifiedEnterBackground(sender notification:Notification)
    {
    }
    
    //MARK: public
    
    func postScore()
    {
        let score:Int = model.score
        
        guard
            
            let dataOption:DOption = self.dataOption
            
        else
        {
            return
        }
        
        dataOption.postScore(score:score)
        
        guard
            
            let gameId:String = dataOption.gameId,
            let parent:ControllerParent = UIApplication.shared.keyWindow?.rootViewController as? ControllerParent
            
        else
        {
            return
        }
        
        parent.gameScore(score:score, gameId:gameId)
    }
    
    func stopTimer()
    {
        lastUpdateTime = nil
    }
}
