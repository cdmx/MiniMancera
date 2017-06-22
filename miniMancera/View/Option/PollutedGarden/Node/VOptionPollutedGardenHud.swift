import SpriteKit

class VOptionPollutedGardenHud:SKSpriteNode
{
    private weak var controller:COptionPollutedGarden!
    private weak var labelScore:SKLabelNode!
    private weak var labelMax:SKLabelNode!
    private let kScoreFontSize:CGFloat = 14
    private let kMaxFontSize:CGFloat = 10
    private let kMargin:CGFloat = 45
    private let kScorePositionX:CGFloat = -30
    private let kScorePositionY:CGFloat = -8
    private let kMaxPositionX:CGFloat = 37
    private let kMaxPositionY:CGFloat = -7
    private let kZPosition:CGFloat = 10001
    private let kScoreZPosition:CGFloat = 10005
    private let kMaxZPosition:CGFloat = 10006
    
    init(controller:COptionPollutedGarden)
    {
        let texture:SKTexture = SKTexture(image:#imageLiteral(resourceName: "assetPollutedGardenHud"))
        let size:CGSize = texture.size()
        self.controller = controller
        
        super.init(texture:texture, color:UIColor.clear, size:size)
        position = startPosition()
        zPosition = kZPosition
        alpha = 0
        
        let labelScore:SKLabelNode = SKLabelNode(fontNamed:UIFont.kFontGame)
        labelScore.fontSize = kScoreFontSize
        labelScore.fontColor = SKColor.white
        labelScore.position = CGPoint(x:kScorePositionX, y:kScorePositionY)
        labelScore.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        labelScore.verticalAlignmentMode = SKLabelVerticalAlignmentMode.baseline
        labelScore.zPosition = kScoreZPosition
        self.labelScore = labelScore
        
        let labelMax:SKLabelNode = SKLabelNode(fontNamed:UIFont.kFontGame)
        labelMax.fontSize = kMaxFontSize
        labelMax.fontColor = SKColor.white
        labelMax.position = CGPoint(x:kMaxPositionX, y:kMaxPositionY)
        labelMax.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        labelMax.verticalAlignmentMode = SKLabelVerticalAlignmentMode.baseline
        labelMax.zPosition = kMaxZPosition
        self.labelMax = labelMax
        
        addChild(labelScore)
        addChild(labelMax)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: private
    
    private func startPosition() -> CGPoint
    {
        let sceneSize:CGSize = controller.model.size
        let sceneWidth:CGFloat = sceneSize.width
        let sceneHeight:CGFloat = sceneSize.height
        let sizeWidth_2:CGFloat = size.width / 2.0
        let posX:CGFloat = sceneWidth - sizeWidth_2
        let posY:CGFloat = sceneHeight - kMargin
        let point:CGPoint = CGPoint(x:posX, y:posY)
        
        return point
    }
    
    //MARK: public
    
    func update(elapsedTime:TimeInterval)
    {
        let scoreString:String = "\(controller.model.score)"
        labelScore.text = scoreString
        
        let maxString:String = "\(controller.model.maxScore)"
        labelMax.text = maxString
    }
}
