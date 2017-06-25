import SpriteKit

class ViewGameScene<T:MGame>:SKScene
{
    private weak var controller:ControllerGame<T>!
    
    required init(controller:ControllerGame<T>)
    {
        super.init(size:MGame.sceneSize)
        backgroundColor = SKColor.black
        scaleMode = SKSceneScaleMode.resizeFill
        delegate = controller
        self.controller = controller
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func didMove(to view:SKView)
    {
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
