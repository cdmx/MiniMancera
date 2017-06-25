import SpriteKit

class ControllerGame<T:MGame>:UIViewController, SKSceneDelegate
{
    
    /*
     var lastUpdateTime:TimeInterval?
     private(set) weak var controller:T!
     private(set) var elapsedTime:TimeInterval
    */
    
    
    
    
    let model:T
    let playSounds:Bool
    private(set) weak var dataOption:DOption?
    
    init(dataOption:DOption)
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
    
    private var scene:ViewGameScene<T>?
    {
        get
        {
            guard
                
                let view:SKView = self.view as? SKView
                
            else
            {
                return nil
            }
            
            let scene:ViewGameScene<T>? = view.scene as? ViewGameScene<T>
            
            return scene
        }
    }
    
    //MARK: notified
    
    func notifiedEnterBackground(sender notification:Notification)
    {
    }
    
    //MARK: private
    
    private func asyncShowMenu()
    {
        let alert:UIAlertController = UIAlertController(
            title:nil,
            message:nil,
            preferredStyle:UIAlertControllerStyle.actionSheet)
        
        let actionResume:UIAlertAction = UIAlertAction(
            title:
            String.localized(key:"ControllerGame_menuResume"),
            style:
            UIAlertActionStyle.cancel)
        { [weak self] (action:UIAlertAction) in
            
            self?.resume()
        }
        
        let actionExit:UIAlertAction = UIAlertAction(
            title:
            String.localized(key:"ControllerGame_menuExit"),
            style:
            UIAlertActionStyle.destructive)
        { [weak self] (action:UIAlertAction) in
            
            self?.exitGame()
        }
        
        alert.addAction(actionResume)
        alert.addAction(actionExit)
        
        if let popover:UIPopoverPresentationController = alert.popoverPresentationController
        {
            popover.sourceView = view
            popover.sourceRect = CGRect.zero
            popover.permittedArrowDirections = UIPopoverArrowDirection.up
        }
        
        present(alert, animated:true, completion:nil)
    }
    
    //MARK: public
    
    func playSound(actionSound:SKAction)
    {
        if playSounds
        {
            scene?.run(actionSound)
        }
    }
    
    func postScore()
    {
        let gameScore:Int = model.score
        postScoreWithScore(score:gameScore)
    }
    
    func postScoreWithScore(score:Int)
    {
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
    
    func pause()
    {
        guard
        
            let view:SKView = self.view as? SKView
        
        else
        {
            return
        }
        
        view.isPaused = true
    }
    
    func resume()
    {
        guard
            
            let view:SKView = self.view as? SKView
            
        else
        {
            return
        }
        
        view.isPaused = false
    }
    
    func showMenu()
    {
        pause()
        
        DispatchQueue.main.async
        { [weak self] in
                
            self?.asyncShowMenu()
        }
    }
    
    func exitGame()
    {
        postScore()
        
        guard
            
            let parent:UIViewController = UIApplication.shared.keyWindow?.rootViewController
        
        else
        {
            return
        }
        
        parent.dismiss(animated:true, completion:nil)
    }
    
    //MARK: scene delegate
    
    func update(_ currentTime:TimeInterval, for scene:SKScene)
    {/*
 
         if controller.model.gameActive
         {
         if let lastUpdateTime:TimeInterval = self.lastUpdateTime
         {
         let deltaTime:TimeInterval = currentTime - lastUpdateTime
         elapsedTime += deltaTime
         
         updateNodes()
         }
         
         lastUpdateTime = currentTime
         }
         
 */
    }
}
