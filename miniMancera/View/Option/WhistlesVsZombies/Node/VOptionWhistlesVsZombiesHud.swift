import SpriteKit

class VOptionWhistlesVsZombiesHud:ViewGameNode<MOptionWhistlesVsZombies>
{
    private weak var labelZombies:SKLabelNode!
    private weak var labelCoins:SKLabelNode!
    private let kFontSize:CGFloat = 14
    private let kPositionX:CGFloat = 180
    private let kPositionY:CGFloat = 45
    private let kLabelPositionY:CGFloat = -10
    private let kZombiesPositionX:CGFloat = -40
    private let kCoinsPositionX:CGFloat = 65
    
    override init(controller:ControllerGame<MOptionWhistlesVsZombies>)
    {
        let texture:MGameTexture = controller.model.textures.hud
        
        super.init(
            controller:controller,
            texture:texture)
        alpha = 0
        
        factoryZombies()
        factoryCoins()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func positionStart()
    {
        let sceneHeight:CGFloat = MGame.sceneSize.width
        let positionY:CGFloat = sceneHeight - kPositionY
        position = CGPoint(x:kPositionX, y:positionY)
    }
    
    //MARK: private
    
    private func factoryZombies()
    {
        let label:SKLabelNode = SKLabelNode()
        label.fontName = UIFont.kFontGame
        label.fontSize = kFontSize
        label.fontColor = SKColor.white
        label.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.right
        label.zPosition = MOptionWhistlesVsZombiesZPosition.HudZombies.rawValue
        label.position = CGPoint(x:kZombiesPositionX, y:kLabelPositionY)
        labelZombies = label
        
        addChild(label)
    }
    
    private func factoryCoins()
    {
        let label:SKLabelNode = SKLabelNode()
        label.fontName = UIFont.kFontGame
        label.fontSize = kFontSize
        label.fontColor = SKColor.white
        label.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.right
        label.zPosition = MOptionWhistlesVsZombiesZPosition.HudCoins.rawValue
        label.position = CGPoint(x:kCoinsPositionX, y:kLabelPositionY)
        labelCoins = label
        
        addChild(label)
    }
    
    //MARK: public
    
    func update(zombies:String, coins:String)
    {
        labelZombies.text = zombies
        labelCoins.text = coins
    }
}
