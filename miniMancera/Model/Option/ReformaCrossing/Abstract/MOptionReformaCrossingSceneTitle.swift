import SpriteKit

class MOptionReformaCrossingSceneTitle:SKScene
{
    private weak var model:MOptionReformaCrossing!
    private let kFont:String = "Arial-BoldMT"
    private let kFontSize:CGFloat = 45
    private let kWaitStartGame:TimeInterval = 1.7
    private let kAnimationDuration:TimeInterval = 0.3
    
    init(model:MOptionReformaCrossing)
    {
        self.model = model
        
        super.init(size:model.size)
        backgroundColor = SKColor.black
        
        let width_2:CGFloat = size.width / 2.0
        let height_2:CGFloat = size.height / 2.0
        
        let background:MOptionReformaCrossingBackground = MOptionReformaCrossingBackground(
            size:size)
        
        let levelNumber:NSNumber = model.level as NSNumber
        let messageTitle:String = String(
            format:NSLocalizedString("MOptionReformaCrossingSceneTitle_labelTitle", comment:""),
            levelNumber)
        
        let labelTitle:SKLabelNode = SKLabelNode(fontNamed:kFont)
        labelTitle.text = messageTitle
        labelTitle.fontSize = kFontSize
        labelTitle.fontColor = SKColor.white
        labelTitle.position = CGPoint(x:width_2, y:height_2)
        
        addChild(background)
        addChild(labelTitle)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func didMove(to view:SKView)
    {
        let actionWait:SKAction = SKAction.wait(forDuration:kWaitStartGame)
        let actionRunGame:SKAction = SKAction.run(startGame)
        let actions:[SKAction] = [
            actionWait,
            actionRunGame]
        let actionsSequence:SKAction = SKAction.sequence(actions)
        
        run(actionsSequence)
    }
    
    //MARK: private
    
    private func startGame()
    {
        let transition:SKTransition = SKTransition.crossFade(
            withDuration:kAnimationDuration)
        let gameScene:MOptionReformaCrossingSceneGame = MOptionReformaCrossingSceneGame(model:model)
        
        view?.presentScene(gameScene, transition:transition)
    }
}
