import SpriteKit

class MOptionReformaCrossingSceneTitle:SKScene
{
    private weak var model:MOptionReformaCrossing!
    private let kFont:String = "Arial-BoldMT"
    private let kFontSize:CGFloat = 45
    
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
        
        /*
        run(SKAction.repeatForever(
            SKAction.sequence([
                SKAction.run(addFoe),
                SKAction.wait(forDuration:3)])))
        
        
        // 1
        backgroundColor = SKColor.white
        
        // 2
        let message = won ? "You Won!" : "You Lose :["
        
        // 3
        let label = SKLabelNode(fontNamed: "Chalkduster")
        label.text = message
        label.fontSize = 40
        label.fontColor = SKColor.black
        label.position = CGPoint(x: size.width/2, y: size.height/2)
        addChild(label)
        
        // 4
        run(SKAction.sequence([
            SKAction.wait(forDuration: 3.0),
            SKAction.run() {
                // 5
                let reveal = SKTransition.flipHorizontal(withDuration: 0.5)
                let scene = GameScene(size: size)
                self.view?.presentScene(scene, transition:reveal)
            }
            ]))*/
    }
    
    //MARK: private
}
