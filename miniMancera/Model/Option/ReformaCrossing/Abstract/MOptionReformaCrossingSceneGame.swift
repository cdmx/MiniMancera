import SpriteKit

class MOptionReformaCrossingSceneGame:SKScene, SKPhysicsContactDelegate
{
    private weak var model:MOptionReformaCrossing!
    private let player:MOptionReformaCrossingPlayer
    private let kSpawnFoeRate:TimeInterval = 0.1
    private let kSpawnProbability:UInt32 = 5
    
    init(model:MOptionReformaCrossing)
    {
        self.model = model
        player = MOptionReformaCrossingPlayer(model:model)
        
        super.init(size:model.size)
        backgroundColor = SKColor.black
        physicsWorld.gravity = CGVector.zero
        physicsWorld.contactDelegate = self
        
        let background:MOptionReformaCrossingBackground = MOptionReformaCrossingBackground(model:model)
        let bar:MOptionReformaCrossingBar = MOptionReformaCrossingBar(model:model)
        let menu:MOptionReformaCrossingMenu = MOptionReformaCrossingMenu(model:model)
        
        addChild(background)
        addChild(bar)
        addChild(menu)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func didMove(to view:SKView)
    {
        startFoes()
        startPlayer()
    }
    
    override func update(_ currentTime:TimeInterval)
    {
        if player.isSafe()
        {
            print("you won")
        }
    }
    
    //MARK: private
    
    private func startPlayer()
    {
        addChild(player)
        player.startWalking()
    }
    
    private func startFoes()
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
    
    private func spawnFoe()
    {
        let should:Bool = shouldSpawn()
        
        if !should
        {
            return
        }
        
        let lane:MOptionReformaCrossingLane = model.laneGroup.randomLane()
        
        let hasFoeWaiting:Bool = lane.hasFoeWaiting(sceneSize:model.size)
        
        if hasFoeWaiting
        {
            return
        }
        
        let foe:MOptionReformaCrossingFoe = MOptionReformaCrossingFoe.randomFoe(
            lane:lane,
            model:model)
        
        addChild(foe)
    }
    
    private func shouldSpawn() -> Bool
    {
        let random:UInt32 = arc4random_uniform(kSpawnProbability)
        
        if random == 0
        {
            return true
        }
        
        return false
    }
    
    private func contactFoes(foeA:MOptionReformaCrossingFoe, foeB:MOptionReformaCrossingFoe)
    {
        if foeA.created < foeB.created
        {
            foeB.hitTheBreaks()
        }
        else
        {
            foeA.hitTheBreaks()
        }
    }
    
    //MARK: contact delegate
    
    func didBegin(_ contact:SKPhysicsContact)
    {
        let bodyA:SKPhysicsBody = contact.bodyA
        let bodyB:SKPhysicsBody = contact.bodyB
        
        if let foeA:MOptionReformaCrossingFoe = bodyA.node as? MOptionReformaCrossingFoe
        {
            if let foeB:MOptionReformaCrossingFoe = bodyB.node as? MOptionReformaCrossingFoe
            {
                contactFoes(foeA:foeA, foeB:foeB)
            }
        }
    }
}
