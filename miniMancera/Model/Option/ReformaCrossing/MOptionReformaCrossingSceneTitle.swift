import SpriteKit

class MOptionReformaCrossingSceneTitle:SKScene
{
    private weak var model:MOptionReformaCrossing!
    
    init(model:MOptionReformaCrossing)
    {
        self.model = model
        
        super.init(size:model.size)
        backgroundColor = SKColor.black
        
        let background:MOptionReformaCrossingBackground = MOptionReformaCrossingBackground(
            size:size)
        
        addChild(background)
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
