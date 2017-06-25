import SpriteKit

class VOptionReformaCrossingSceneOver:SKScene
{
    private weak var controller:COptionReformaCrossing!
    private let shouldPlaySounds:Bool
    private let kSoundBackground:String = "soundReformaCrossing.caf"
    private let kSound1up:String = "sound1up"
    private let kTitleFontSize:CGFloat = 20
    private let kDescrFontSize:CGFloat = 12
    private let kButtonsFontSize:CGFloat = 12
    private let kTitleAddY:CGFloat = 167
    private let kDescrAddY:CGFloat = 150
    private let k1upY:CGFloat = 180
    private let kGameOverY:CGFloat = 80
    private let kAnimationDuration:TimeInterval = 0.5
    
    init(controller:COptionReformaCrossing, reason:MOptionReformaCrossingGameOverProtocol)
    {
        self.controller = controller
        
        if let sounds:Bool = MSession.sharedInstance.settings?.sounds
        {
            shouldPlaySounds = sounds
        }
        else
        {
            shouldPlaySounds = true
        }
        
//        super.init(size:controller.model.size)
        super.init(size:CGSize.zero)
        backgroundColor = SKColor.black
        
        let width_2:CGFloat = size.width / 2.0
        let height_2:CGFloat = size.height / 2.0
        let titleY:CGFloat = height_2 + kTitleAddY
        let descrY:CGFloat = height_2 + kDescrAddY
        
        let background:VOptionReformaCrossingBackground = VOptionReformaCrossingBackground(
            controller:controller)
        
        let labelTitle:SKLabelNode = SKLabelNode(fontNamed:UIFont.kFontBold)
        labelTitle.text = reason.title
        labelTitle.fontSize = kTitleFontSize
        labelTitle.fontColor = SKColor.white
        labelTitle.position = CGPoint(x:width_2, y:titleY)
        
        let labelDescr:SKLabelNode = SKLabelNode(fontNamed:UIFont.kFontBold)
        labelDescr.text = reason.descr
        labelDescr.fontSize = kDescrFontSize
        labelDescr.fontColor = SKColor.white
        labelDescr.position = CGPoint(x:width_2, y:descrY)
        
        let label1up:SKLabelNode = SKLabelNode(fontNamed:UIFont.kFontRegular)
        label1up.text = String.localizedReformaCrossing(key:"VOptionReformaCrossingSceneOver_label1up")
        label1up.fontSize = kButtonsFontSize
        label1up.fontColor = SKColor.white
        label1up.position = CGPoint(x:width_2, y:k1upY)
        
        let labelGameOver:SKLabelNode = SKLabelNode(fontNamed:UIFont.kFontRegular)
        labelGameOver.text = String.localizedReformaCrossing(key:"VOptionReformaCrossingSceneOver_labelGameOver")
        labelGameOver.fontSize = kButtonsFontSize
        labelGameOver.fontColor = SKColor.white
        labelGameOver.position = CGPoint(x:width_2, y:kGameOverY)
        
        let texture:SKTexture = SKTexture(image:reason.image)
        let image:SKSpriteNode = SKSpriteNode(texture:texture)
        image.position = CGPoint(x:width_2, y:height_2)
        
        let node1up:VOptionReformaCrossing1up = VOptionReformaCrossing1up(controller:controller)
        let nodeGameOver:VOptionReformaCrossingEnd = VOptionReformaCrossingEnd(controller:controller)
        
        addChild(background)
        addChild(labelTitle)
        addChild(labelDescr)
        addChild(label1up)
        addChild(labelGameOver)
        addChild(image)
        addChild(node1up)
        addChild(nodeGameOver)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func didMove(to view:SKView)
    {
        if shouldPlaySounds
        {
            let background:SKAudioNode = SKAudioNode(fileNamed:kSoundBackground)
            background.autoplayLooped = true
            
            addChild(background)
        }
    }
    
    //MARK: public
    
    func game1up()
    {
        if shouldPlaySounds
        {
            let action1up:SKAction = SKAction.playSoundFileNamed(
                kSound1up,
                waitForCompletion:false)
            
            run(action1up)
        }
        
        let transition:SKTransition = SKTransition.crossFade(
            withDuration:kAnimationDuration)
        let gameScene:VOptionReformaCrossingScene = VOptionReformaCrossingScene(
            controller:controller)
        
        view?.presentScene(gameScene, transition:transition)
    }
}
