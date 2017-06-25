import SpriteKit

class ViewGameScene:SKScene
{
    private weak var controller:ControllerGame!
    
    required init(controller:ControllerGame)
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
