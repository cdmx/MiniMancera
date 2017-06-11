import SpriteKit

class MOptionReformaCrossingScene:SKScene
{
    let player:MOptionReformaCrossingPlayer
    
    override init(size:CGSize)
    {
        player = MOptionReformaCrossingPlayer(imageNamed:"assetReformaCrossingPlayer0")
        
        super.init(size:size)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func didMove(to view:SKView)
    {
        backgroundColor = SKColor.white
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
