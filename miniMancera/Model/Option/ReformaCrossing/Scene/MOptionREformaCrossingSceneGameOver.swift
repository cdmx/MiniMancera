import SpriteKit

class MOptionReformaCrossingSceneGameOver:SKScene
{
    private weak var controller:COptionReformaCrossing!
    private let kTitleFontSize:CGFloat = 35
    private let kDescrFontSize:CGFloat = 16
    private let kTitleAddY:CGFloat = 100
    private let kDescrAddY:CGFloat = 60
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
        labelDescr.text = reason.title
        labelDescr.fontSize = kTitleFontSize
        labelDescr.fontColor = SKColor.white
        labelDescr.position = CGPoint(x:width_2, y:descrY)
        
        addChild(background)
        addChild(labelTitle)
        addChild(labelDescr)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func didMove(to view:SKView)
    {
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
