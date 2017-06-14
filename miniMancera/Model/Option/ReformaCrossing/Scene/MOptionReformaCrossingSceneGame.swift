import SpriteKit

class MOptionReformaCrossingSceneGame:SKScene, SKPhysicsContactDelegate
{
    var lastUpdateTime:TimeInterval?
    private(set) var elapsedTime:TimeInterval
    private(set) weak var player:MOptionReformaCrossingPlayer!
    private(set) weak var hud:MOptionReformaCrossingHud!
    private weak var controller:COptionReformaCrossing!
    private weak var stop:MOptionReformaCrossingStop!
    private weak var menu:MOptionReformaCrossingMenu!
    private weak var labelTitle:SKLabelNode?
    private let kActionSpawn:String = "actionSpawn"
    private let kWaitTransition:TimeInterval = 1.5
    private let kSceneTransitionDuration:TimeInterval = 1
    private let kSpawnFoeRate:TimeInterval = 0.1
    private let kTitleDuration:TimeInterval = 1.5
    private let kFadeInDuration:TimeInterval = 0.5
    private let kFontSize:CGFloat = 30
    private let kTitleVerticalAdd:CGFloat = -10
    private let kSpawnProbability:UInt32 = 6
    
    init(controller:COptionReformaCrossing)
    {
        self.controller = controller
        elapsedTime = 0
        controller.model.startLevel()
        
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
        self.menu = menu
        
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
        
        guard
            
            let foe:MOptionReformaCrossingFoe = MOptionReformaCrossingFoe.randomFoe(
                lane:lane,
                controller:controller)
        
        else
        {
            return
        }
        
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
    
    private func contactPlayerFoe(player:MOptionReformaCrossingPlayer, foe:MOptionReformaCrossingFoe)
    {
        controller.hitAndRun()
    }
    
    private func actionsGameOver(reason:MOptionReformaCrossingGameOverProtocol)
    {
        let actionDelay:SKAction = SKAction.wait(forDuration:kWaitTransition)
        let actionTransition:SKAction = SKAction.run
        { [weak self] in
            
            self?.afterDelayGameOver(reason:reason)
        }
        
        let actions:[SKAction] = [
            actionDelay,
            actionTransition]
        let actionsSequence:SKAction = SKAction.sequence(actions)
        
        run(actionsSequence)
    }
    
    private func afterDelayGameOver(reason:MOptionReformaCrossingGameOverProtocol)
    {
        removeAllActions()
        
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
        let positionY:CGFloat = height_2 + kTitleVerticalAdd
        
        let level:NSNumber = controller.model.level as NSNumber
        let levelString:String = String(
            format:NSLocalizedString("MOptionReformaCrossingSceneGame_labelTitle", comment:""),
            level)
        
        let labelTitle:SKLabelNode = SKLabelNode(fontNamed:UIFont.kFontBold)
        labelTitle.text = levelString
        labelTitle.fontSize = kFontSize
        labelTitle.fontColor = SKColor.white
        labelTitle.position = CGPoint(x:width_2, y:positionY)
        self.labelTitle = labelTitle
        
        addChild(labelTitle)
        
        actionsActivateGame()
    }
    
    private func actionsActivateGame()
    {
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
        fadeInControls()
        
        labelTitle?.removeFromParent()
        controller.model.activateGame()
        player.startWalking()
    }
    
    private func fadeInControls()
    {
        let actionFade:SKAction = SKAction.fadeIn(withDuration:kFadeInDuration)
        
        hud.run(actionFade)
        menu.run(actionFade)
        stop.run(actionFade)
    }
    
    private func transitionNextLevel()
    {
        let transition:SKTransition = SKTransition.crossFade(
            withDuration:kSceneTransitionDuration)
        let gameOverScene:MOptionReformaCrossingSceneGame = MOptionReformaCrossingSceneGame(
            controller:controller)
        
        guard
            
            let view:SKView = self.view
        
        else
        {
            return
        }
        
        removeAllActions()
        view.presentScene(gameOverScene, transition:transition)
    }
    
    //MARK: public
    
    func timeOut()
    {
        removeAction(forKey:kActionSpawn)
        player.timeOut()
        
        let reason:MOptionReformaCrossingGameOverTimeOut = MOptionReformaCrossingGameOverTimeOut()
        actionsGameOver(reason:reason)
    }
    
    func hitAndRun()
    {
        player.hitAndRun()
        
        let reason:MOptionReformaCrossingGameOverHitAndRun = MOptionReformaCrossingGameOverHitAndRun()
        actionsGameOver(reason:reason)
    }
    
    func gameSuccess()
    {
        let actionDelay:SKAction = SKAction.wait(forDuration:kWaitTransition)
        let actionTransition:SKAction = SKAction.run(transitionNextLevel)
        let actions:[SKAction] = [
            actionDelay,
            actionTransition]
        let actionsSequence:SKAction = SKAction.sequence(actions)
        
        run(actionsSequence)
    }
    
    func createCoinOn(lane:MOptionReformaCrossingLane)
    {
        let coin:MOptionReformaCrossingCoin = MOptionReformaCrossingCoin(
            lane:lane,
            controller:controller)
        
        addChild(coin)
    }
    
    //MARK: contact delegate
    
    func didBegin(_ contact:SKPhysicsContact)
    {
        let bodyA:SKNode? = contact.bodyA.node
        let bodyB:SKNode? = contact.bodyB.node
        
        if let foeA:MOptionReformaCrossingFoe = bodyA as? MOptionReformaCrossingFoe
        {
            if let player:MOptionReformaCrossingPlayer = bodyB as? MOptionReformaCrossingPlayer
            {
                contactPlayerFoe(player:player, foe:foeA)
            }
            else if let foeB:MOptionReformaCrossingFoe = bodyB as? MOptionReformaCrossingFoe
            {
                contactFoes(foeA:foeA, foeB:foeB)
            }
        }
        else if let player:MOptionReformaCrossingPlayer = bodyA as? MOptionReformaCrossingPlayer
        {
            if let foeB:MOptionReformaCrossingFoe = bodyB as? MOptionReformaCrossingFoe
            {
                contactPlayerFoe(player:player, foe:foeB)
            }
        }
    }
}
