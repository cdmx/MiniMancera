import SpriteKit

class MOptionReformaCrossingSceneGameOver:SKScene
{
    private weak var controller:COptionReformaCrossing!
    private let kTitleFontSize:CGFloat = 25
    private let kDescrFontSize:CGFloat = 14
    private let kButtonsFontSize:CGFloat = 12
    private let kTitleAddY:CGFloat = 180
    private let kDescrAddY:CGFloat = 150
    private let k1upY:CGFloat = 180
    private let kGameOverY:CGFloat = 80
    private let kAnimationDuration:TimeInterval = 0.5
    
    init(controller:COptionReformaCrossing, reason:MOptionReformaCrossingGameOverProtocol)
    {
        self.controller = controller
        
        super.init(size:controller.model.size)
        backgroundColor = SKColor.black
        
        let width_2:CGFloat = size.width / 2.0
        let height_2:CGFloat = size.height / 2.0
        let titleY:CGFloat = height_2 + kTitleAddY
        let descrY:CGFloat = height_2 + kDescrAddY
        
        let background:MOptionReformaCrossingBackground = MOptionReformaCrossingBackground(
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
        label1up.text = NSLocalizedString("MOptionReformaCrossingSceneGameOver_label1up", comment:"")
        label1up.fontSize = kButtonsFontSize
        label1up.fontColor = SKColor.white
        label1up.position = CGPoint(x:width_2, y:k1upY)
        
        let labelGameOver:SKLabelNode = SKLabelNode(fontNamed:UIFont.kFontRegular)
        labelGameOver.text = NSLocalizedString("MOptionReformaCrossingSceneGameOver_labelGameOver", comment:"")
        labelGameOver.fontSize = kButtonsFontSize
        labelGameOver.fontColor = SKColor.white
        labelGameOver.position = CGPoint(x:width_2, y:kGameOverY)
        
        let texture:SKTexture = SKTexture(image:reason.image)
        let image:SKSpriteNode = SKSpriteNode(texture:texture)
        image.position = CGPoint(x:width_2, y:height_2)
        
        let node1up:MOptionReformaCrossing1up = MOptionReformaCrossing1up(controller:controller)
        let nodeGameOver:MOptionReformaCrossingEnd = MOptionReformaCrossingEnd(controller:controller)
        
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
    
    //MARK: private
    
    private func startGame()
    {
        let transition:SKTransition = SKTransition.crossFade(
            withDuration:kAnimationDuration)
        let gameScene:MOptionReformaCrossingSceneGame = MOptionReformaCrossingSceneGame(
            controller:controller)
        
        view?.presentScene(gameScene, transition:transition)
    }
}
