import SpriteKit

class VOptionReformaCrossingHud:ViewGameNode<MOptionReformaCrossing>
{
    private weak var labelTime:SKLabelNode!
    private weak var labelScore:SKLabelNode!
    private let kTimeFontSize:CGFloat = 15
    private let kScoreFontSize:CGFloat = 12
    private let kMargin:CGFloat = 45
    private let kTimePositionX:CGFloat = 65
    private let kTimePositionY:CGFloat = -10
    private let kScorePositionX:CGFloat = -32
    private let kScorePositionY:CGFloat = -8
    
    override init(controller:ControllerGame<MOptionReformaCrossing>)
    {
        let texture:MGameTexture = controller.model.textures.hud
        
        super.init(
            controller:controller,
            texture:texture)
        alpha = 0
        
        let labelTime:SKLabelNode = SKLabelNode(fontNamed:UIFont.kFontGame)
        labelTime.fontSize = kTimeFontSize
        labelTime.fontColor = SKColor.white
        labelTime.position = CGPoint(x:kTimePositionX, y:kTimePositionY)
        labelTime.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.right
        labelTime.verticalAlignmentMode = SKLabelVerticalAlignmentMode.baseline
        labelTime.zPosition = MOptionReformaCrossingZPosition.HudTime.rawValue
        self.labelTime = labelTime
        
        let labelScore:SKLabelNode = SKLabelNode(fontNamed:UIFont.kFontGame)
        labelScore.fontSize = kScoreFontSize
        labelScore.fontColor = SKColor.white
        labelScore.position = CGPoint(x:kScorePositionX, y:kScorePositionY)
        labelScore.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        labelScore.verticalAlignmentMode = SKLabelVerticalAlignmentMode.baseline
        labelScore.zPosition = MOptionReformaCrossingZPosition.HudScore.rawValue
        self.labelScore = labelScore
        
        addChild(labelTime)
        addChild(labelScore)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func positionStart()
    {
        let sceneSize:CGSize = MGame.sceneSize
        let sceneWidth:CGFloat = sceneSize.width
        let sceneHeight:CGFloat = sceneSize.height
        let sizeWidth_2:CGFloat = size.width / 2.0
        let posX:CGFloat = sceneWidth - sizeWidth_2
        let posY:CGFloat = sceneHeight - kMargin
        position = CGPoint(x:posX, y:posY)
    }
    
    //MARK: public
    
    func update(time:String, score:String)
    {
        labelTime.text = time
        labelScore.text = score
    }
}
