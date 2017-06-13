import SpriteKit

class MOptionReformaCrossingSceneGame:SKScene, SKPhysicsContactDelegate
{
    var lastUpdateTime:TimeInterval?
    private(set) var elapsedTime:TimeInterval
    private(set) weak var player:MOptionReformaCrossingPlayer!
    private(set) weak var hud:MOptionReformaCrossingHud!
    private weak var controller:COptionReformaCrossing!
    private weak var stop:MOptionReformaCrossingStop!
    private let kActionSpawn:String = "actionSpawn"
    private let kSpawnFoeRate:TimeInterval = 0.1
    private let kSpawnProbability:UInt32 = 5
    
    init(controller:COptionReformaCrossing)
    {
        self.controller = controller
        elapsedTime = 0
        
        super.init(size:controller.model.size)
        backgroundColor = SKColor.black
        physicsWorld.gravity = CGVector.zero
        physicsWorld.contactDelegate = self
        
        let background:MOptionReformaCrossingBackground = MOptionReformaCrossingBackground(
            controller:controller)
        
        let hud:MOptionReformaCrossingHud = MOptionReformaCrossingHud(
            controller:controller)
        self.hud = hud
        
        let menu:MOptionReformaCrossingMenu = MOptionReformaCrossingMenu(
            controller:controller)
        
        let stop:MOptionReformaCrossingStop = MOptionReformaCrossingStop(
            controller:controller)
        self.stop = stop
        
        let player:MOptionReformaCrossingPlayer = MOptionReformaCrossingPlayer(controller:controller)
        self.player = player
        
        addChild(background)
        addChild(player)
        addChild(hud)
        addChild(menu)
        addChild(stop)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func didMove(to view:SKView)
    {
        startFoes()
        player.startWalking()
    }
    
    override func update(_ currentTime:TimeInterval)
    {
        if let lastUpdateTime:TimeInterval = self.lastUpdateTime
        {
            let deltaTime:TimeInterval = currentTime - lastUpdateTime
            elapsedTime += deltaTime
            
            updateNodes()
        }
        
        lastUpdateTime = currentTime
        
        if player.isSafe()
        {
        }
    }
    
    //MARK: private
    
    private func updateNodes()
    {
        player.update(elapsedTime:elapsedTime)
        stop.update(elapsedTime:elapsedTime)
        hud.update(elapsedTime:elapsedTime)
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
        
        run(actionRepeat, withKey:kActionSpawn)
    }
    
    private func spawnFoe()
    {
        let should:Bool = shouldSpawn()
        
        if !should
        {
            return
        }
        
        let lane:MOptionReformaCrossingLane = controller.model.laneGroup.randomLane()
        
        let hasFoeWaiting:Bool = lane.hasFoeWaiting(
            sceneSize:controller.model.size)
        
        if hasFoeWaiting
        {
            return
        }
        
        let foe:MOptionReformaCrossingFoe = MOptionReformaCrossingFoe.randomFoe(
            lane:lane,
            controller:controller)
        
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
    
    //MARK: public
    
    func timeOut()
    {
        removeAction(forKey:kActionSpawn)
        player.timeOut()
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
