import SpriteKit

class MOptionReformaCrossingSceneGame:SKScene
{
    private weak var model:MOptionReformaCrossing!
    private let player:MOptionReformaCrossingPlayer
    private let kSpawnFoeRate:TimeInterval = 1
    
    init(model:MOptionReformaCrossing)
    {
        self.model = model
        player = MOptionReformaCrossingPlayer(sceneSize:model.size)
        
        super.init(size:model.size)
        backgroundColor = SKColor.black
        
        let background:MOptionReformaCrossingBackground = MOptionReformaCrossingBackground(
            size:size)
        
        addChild(background)
        addChild(player)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func didMove(to view:SKView)
    {
        let actionSpawnFoe:SKAction = SKAction.run(spawnFoe)
        let actionDelay:SKAction = SKAction.wait(forDuration:kSpawnFoeRate)
        let actions:[SKAction] = [
            actionSpawnFoe,
            actionDelay]
        let actionsSequence:SKAction = SKAction.sequence(actions)
        let actionRepeat:SKAction = SKAction.repeatForever(actionsSequence)
        
        run(actionRepeat)
    }
    
    //MARK: private
    
    private func spawnFoe()
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