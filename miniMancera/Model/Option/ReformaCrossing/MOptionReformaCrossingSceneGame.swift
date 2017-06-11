import SpriteKit

class MOptionReformaCrossingSceneGame:SKScene
{
    private weak var model:MOptionReformaCrossing!
    let player:MOptionReformaCrossingPlayer
    
    init(model:MOptionReformaCrossing)
    {
        self.model = model
        player = MOptionReformaCrossingPlayer()
        
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
        
        
        
        player.position = CGPoint(x:view.bounds.size.width / 2, y:view.bounds.size.height / 2)
        
        
        addChild(player)
        
        run(SKAction.repeatForever(
            SKAction.sequence([
                SKAction.run(addFoe),
                SKAction.wait(forDuration:3)])))
    }
    
    //MARK: private
    
    private func addFoe()
    {
        let foe:SKSpriteNode = factoryFoe()
        
        foe.position = CGPoint(x:foe.size.width / 2.0, y:200)
        
        addChild(foe)
        
        let actualDuration:TimeInterval = 8
        
        let actionMove = SKAction.move(to: CGPoint(x:size.width + (foe.size.width / 2), y:200), duration:actualDuration)
        let actionMoveDone = SKAction.removeFromParent()
        foe.run(SKAction.sequence([actionMove, actionMoveDone]))
    }
    
    private func factoryFoe() -> SKSpriteNode
    {
        let foe:SKSpriteNode = SKSpriteNode(imageNamed:"assetReformaCrossingVW")
        
        return foe
    }
}
