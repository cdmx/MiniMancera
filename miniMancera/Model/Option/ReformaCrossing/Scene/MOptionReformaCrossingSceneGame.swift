import SpriteKit

class MOptionReformaCrossingSceneGame:ViewGame<MOptionReformaCrossing, COptionReformaCrossing>
{
    let soundHonk:SKAction
    private(set) weak var player:MOptionReformaCrossingPlayer!
    private weak var hud:MOptionReformaCrossingHud!
    private weak var stop:MOptionReformaCrossingStop!
    private weak var menu:MOptionReformaCrossingMenu!
    private weak var labelTitle:SKLabelNode?
    private let soundCoin:SKAction
    private let soundFail:SKAction
    private let soundVictory:SKAction
    private let kSoundCoin:String = "soundCoin.caf"
    private let kSoundFail:String = "soundFail.caf"
    private let kSoundVictory:String = "soundVictory.caf"
    private let kSoundHonk:String = "soundCarHorn.caf"
    private let kActionSpawn:String = "actionSpawn"
    private let kWaitTransition:TimeInterval = 1.5
    private let kSceneTransitionDuration:TimeInterval = 1
    private let kSpawnFoeRate:TimeInterval = 0.1
    private let kTitleDuration:TimeInterval = 1.5
    private let kFadeInDuration:TimeInterval = 0.5
    private let kFontSize:CGFloat = 30
    private let kTitleVerticalAdd:CGFloat = -10
    private let kSpawnProbability:UInt32 = 6
    
    override init(controller:COptionReformaCrossing)
    {
        controller.model.startLevel()
        soundCoin = SKAction.playSoundFileNamed(kSoundCoin, waitForCompletion:false)
        soundFail = SKAction.playSoundFileNamed(kSoundFail, waitForCompletion:false)
        soundVictory = SKAction.playSoundFileNamed(kSoundVictory, waitForCompletion:false)
        soundHonk = SKAction.playSoundFileNamed(kSoundHonk, waitForCompletion:false)
        
        super.init(controller:controller)
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
        super.didMove(to:view)
        
        startFoes()
        showTitle()
    }
    
    override func updateNodes()
    {
        player.update(elapsedTime:elapsedTime)
        stop.update(elapsedTime:elapsedTime)
        hud.update(elapsedTime:elapsedTime)
    }
    
    //MARK: private
    
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
            format:String.localizedReformaCrossing(key:"MOptionReformaCrossingSceneGame_labelTitle"),
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
        playSound(actionSound:soundFail)
        
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
        playSound(actionSound:soundVictory)
        
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
        playSound(actionSound:soundCoin)
        
        let coin:MOptionReformaCrossingCoin = MOptionReformaCrossingCoin(
            lane:lane,
            controller:controller)
        
        addChild(coin)
    }
    
    //MARK: contact delegate
    
    func didBegin(_ contact:SKPhysicsContact)
    {
        contactBegin(contact:contact)
    }
}
