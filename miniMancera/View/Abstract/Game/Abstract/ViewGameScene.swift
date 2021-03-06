import SpriteKit

class ViewGameScene<T:MGame>:SKScene
{
    private(set) weak var controller:ControllerGame<T>!
    
    required init(controller:ControllerGame<T>)
    {
        super.init(size:MGame.sceneSize)
        backgroundColor = SKColor.black
        scaleMode = SKSceneScaleMode.resizeFill
        delegate = controller
        physicsWorld.contactDelegate = controller
        self.controller = controller
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func didMove(to view:SKView)
    {
        controller.didMove()
        
        if controller.playSounds
        {
            startBackgroundSound()
        }
    }
    
    //MARK: private
    
    private func startBackgroundSound()
    {
        guard
            
            let sound:String = controller.model.soundBackground
            
        else
        {
            return
        }
        
        let background:SKAudioNode = SKAudioNode(fileNamed:sound)
        background.autoplayLooped = true
        
        addChild(background)
    }
}
