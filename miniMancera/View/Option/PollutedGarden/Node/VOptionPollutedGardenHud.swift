import SpriteKit

class VOptionPollutedGardenHud:ViewGameNode<MOptionPollutedGarden>
{
    private weak var labelScore:SKLabelNode!
    private weak var labelMax:SKLabelNode!
    private let kScoreFontSize:CGFloat = 14
    private let kMaxFontSize:CGFloat = 10
    private let kMargin:CGFloat = 45
    private let kScorePositionX:CGFloat = -30
    private let kScorePositionY:CGFloat = -8
    private let kMaxPositionX:CGFloat = 37
    private let kMaxPositionY:CGFloat = -7
    
    override init(controller:ControllerGame<MOptionPollutedGarden>)
    {
        let texture:MGameTexture = controller.model.textures.hud
        
        super.init(
            controller:controller,
            texture:texture)
        alpha = 0
        
        let labelScore:SKLabelNode = SKLabelNode(fontNamed:UIFont.kFontGame)
        labelScore.fontSize = kScoreFontSize
        labelScore.fontColor = SKColor.white
        labelScore.position = CGPoint(x:kScorePositionX, y:kScorePositionY)
        labelScore.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        labelScore.verticalAlignmentMode = SKLabelVerticalAlignmentMode.baseline
        labelScore.zPosition = MOptionPollutedGardenZPosition.HudScore.rawValue
        self.labelScore = labelScore
        
        let labelMax:SKLabelNode = SKLabelNode(fontNamed:UIFont.kFontGame)
        labelMax.fontSize = kMaxFontSize
        labelMax.fontColor = SKColor.white
        labelMax.position = CGPoint(x:kMaxPositionX, y:kMaxPositionY)
        labelMax.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        labelMax.verticalAlignmentMode = SKLabelVerticalAlignmentMode.baseline
        labelMax.zPosition = MOptionPollutedGardenZPosition.HudMax.rawValue
        self.labelMax = labelMax
        
        addChild(labelScore)
        addChild(labelMax)
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
        let sizeWidth_2:CGFloat = modelTexture.width_2
        let posX:CGFloat = sceneWidth - sizeWidth_2
        let posY:CGFloat = sceneHeight - kMargin
        position = CGPoint(x:posX, y:posY)
    }
    
    //MARK: public
    
    func update(score:String, max:String)
    {
        labelScore.text = score
        labelMax.text = max
    }
}
