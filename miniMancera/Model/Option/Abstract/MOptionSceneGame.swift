import SpriteKit

class MOptionSceneGame<S:MOptionProtocol, T:ControllerGame<S>>:SKScene
{
    let shouldPlaySounds:Bool
    var lastUpdateTime:TimeInterval?
    private(set) weak var controller:T!
    private(set) var elapsedTime:TimeInterval
    
    init(controller:T)
    {
        self.controller = controller
        elapsedTime = 0
        
        if let sounds:Bool = MSession.sharedInstance.settings?.sounds
        {
            shouldPlaySounds = sounds
        }
        else
        {
            shouldPlaySounds = true
        }
        
        super.init(size:controller.model.size)
        backgroundColor = SKColor.black
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func didMove(to view:SKView)
    {
        if playSounds
        {
            startBackgroundSound()
        }
    }
    
    override func update(_ currentTime:TimeInterval)
    {
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
    
    //MARK: public
    
    func updateNodes()
    {
    }
    
    func playSound(soundName:String)
    {
        if shouldPlaySounds
        {
            let actionHonk:SKAction = SKAction.playSoundFileNamed(
                soundName,
                waitForCompletion:false)
            
            run(actionHonk)
        }
    }
}
