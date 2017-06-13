import SpriteKit

class MOptionReformaCrossingSceneGame:SKScene, SKPhysicsContactDelegate
{
    var lastUpdateTime:TimeInterval?
    private(set) var elapsedTime:TimeInterval
    private(set) weak var player:MOptionReformaCrossingPlayer!
    private(set) weak var hud:MOptionReformaCrossingHud!
    private weak var controller:COptionReformaCrossing!
    private weak var stop:MOptionReformaCrossingStop!
    private weak var labelTitle:SKLabelNode?
    private let kActionSpawn:String = "actionSpawn"
    private let kSceneTransitionDuration:TimeInterval = 1
    private let kSpawnFoeRate:TimeInterval = 0.1
    private let kTitleDuration:TimeInterval = 1
    private let kFontSize:CGFloat = 20
    private let kSpawnProbability:UInt32 = 5
    
    init(controller:COptionReformaCrossing)
    {
        self.controller = controller
        elapsedTime = 0
        controller.model.restart()
        
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
        showTitle()
    }
    
    override func update(_ currentTime:TimeInterval)
    {
        if controller.model.gameActive
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
    
    private func actionsGameOver(reason:MOptionReformaCrossingGameOverProtocol)
    {
        let transition:SKTransition = SKTransition.crossFade(
            withDuration:kSceneTransitionDuration)
        let gameOverScene:MOptionReformaCrossingSceneGameOver = MOptionReformaCrossingSceneGameOver(
            controller:controller, reason:reason)
        
        view?.presentScene(gameOverScene, transition:transition)
    }
    
    private func showTitle()
    {
        let width_2:CGFloat = controller.model.size.width / 2.0
        let height_2:CGFloat = controller.model.size.height / 2.0
        
        let labelTitle:SKLabelNode = SKLabelNode(fontNamed:UIFont.kFontBold)
        labelTitle.text = NSLocalizedString("MOptionReformaCrossingSceneGame_labelTitle", comment:"")
        labelTitle.fontSize = kFontSize
        labelTitle.fontColor = SKColor.white
        labelTitle.position = CGPoint(x:width_2, y:height_2)
        self.labelTitle = labelTitle
        
        addChild(labelTitle)
        
        let actionDelay:SKAction = SKAction.wait(forDuration:kTitleDuration)
        let actionActivateGame:SKAction = SKAction.run(activateGame)
        let actions:[SKAction] = [
            actionDelay,
            actionActivateGame]
        let actionsSequence:SKAction = SKAction.sequence(actions)
        
        run(actionsSequence)
    }
    
    private func activateGame()
    {
        controller.model.activateGame()
        labelTitle?.removeFromParent()
        player.startWalking()
    }
    
    //MARK: public
    
    func timeOut()
    {
        removeAction(forKey:kActionSpawn)
        player.timeOut()
        
        let reason:MOptionReformaCrossingGameOverTimeOut = MOptionReformaCrossingGameOverTimeOut()
        actionsGameOver(reason:reason)
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
