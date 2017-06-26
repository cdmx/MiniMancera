import SpriteKit

class ControllerGame<T:MGame>:UIViewController, SKSceneDelegate
{
    let model:T
    let playSounds:Bool
    private(set) weak var dataOption:DOption?
    private(set) var lastUpdateTime:TimeInterval?
    private(set) var elapsedTime:TimeInterval
    
    required init(dataOption:DOption)
    {
        self.dataOption = dataOption
        model = T()
        
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
    
    override func viewDidAppear(_ animated:Bool)
    {
        super.viewDidAppear(animated)
        
        guard
        
            let parent:ControllerParent = self.parent as? ControllerParent,
            let view:ViewParent = parent.view as? ViewParent
        
        else
        {
            return
        }
        
        view.panRecognizer.isEnabled = false
    }
    
    //MARK: notified
    
    func notifiedEnterBackground(sender notification:Notification)
    {
    }
    
    //MARK: public
    
    func didMove()
    {
    }
    
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
    
    //MARK: scene delegate
    
    func update(_ currentTime:TimeInterval, for scene:SKScene)
    {
        if model.gameActive
        {
            if let lastUpdateTime:TimeInterval = self.lastUpdateTime
            {
                let deltaTime:TimeInterval = currentTime - lastUpdateTime
                elapsedTime += deltaTime
                
                guard
                    
                    let scene:ViewGameScene<T> = scene as? ViewGameScene<T>
                
                else
                {
                    return
                }
                
                model.update(elapsedTime:elapsedTime, scene:scene)
            }
            
            lastUpdateTime = currentTime
        }
    }
}
