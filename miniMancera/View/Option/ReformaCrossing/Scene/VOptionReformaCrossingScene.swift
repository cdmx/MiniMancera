import SpriteKit

class VOptionReformaCrossingScene:ViewGameScene<MOptionReformaCrossing>
{
    weak var player:VOptionReformaCrossingPlayer!
    weak var hud:VOptionReformaCrossingHud!
    weak var stop:VOptionReformaCrossingStop!
    weak var menu:VOptionReformaCrossingMenu!
    weak var labelTitle:SKLabelNode?
    private let kWaitTransition:TimeInterval = 1.5
    private let kSceneTransitionDuration:TimeInterval = 1
    private let kSpawnFoeRate:TimeInterval = 0.1
    private let kTitleDuration:TimeInterval = 1.5
    private let kFadeInDuration:TimeInterval = 0.5
    private let kFontSize:CGFloat = 20
    private let kTitleVerticalAdd:CGFloat = -12
    private let kSpawnProbability:UInt32 = 6
    
    required init(controller:ControllerGame<MOptionReformaCrossing>)
    {
        controller.model.startLevel()
        
        super.init(controller:controller)
        physicsWorld.gravity = CGVector.zero
        physicsWorld.contactDelegate = self

        /*
        let menu:VOptionReformaCrossingMenu = VOptionReformaCrossingMenu(
            controller:controller)
        self.menu = menu
        
        let stop:VOptionReformaCrossingStop = VOptionReformaCrossingStop(
            controller:controller)
        self.stop = stop
        
        let player:VOptionReformaCrossingPlayer = VOptionReformaCrossingPlayer(
            controller:controller)
        self.player = player
        
        addChild(player)
        addChild(menu)
        addChild(stop)*/
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    /*
    override func updateNodes()
    {
        player.update(elapsedTime:elapsedTime)
        stop.update(elapsedTime:elapsedTime)
        hud.update(elapsedTime:elapsedTime)
    }*/
    
    //MARK: private
    
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
        /*
        let transition:SKTransition = SKTransition.crossFade(
            withDuration:kSceneTransitionDuration)
        let gameOverScene:VOptionReformaCrossingSceneOver = VOptionReformaCrossingSceneOver(
            controller:controller, reason:reason)
        
        view?.presentScene(gameOverScene, transition:transition)*/
    }
    
    private func showTitle()
    {/*
        let width_2:CGFloat = controller.model.size.width / 2.0
        let height_2:CGFloat = controller.model.size.height / 2.0
        let positionY:CGFloat = height_2 + kTitleVerticalAdd
        
        let level:NSNumber = controller.model.level as NSNumber
        let levelString:String = String(
            format:String.localizedReformaCrossing(key:"VOptionReformaCrossingScene_labelTitle"),
            level)
        
        let labelTitle:SKLabelNode = SKLabelNode(fontNamed:UIFont.kFontGame)
        labelTitle.text = levelString
        labelTitle.fontSize = kFontSize
        labelTitle.fontColor = SKColor.white
        labelTitle.position = CGPoint(x:width_2, y:positionY)
        self.labelTitle = labelTitle
        
        addChild(labelTitle)
        
        actionsActivateGame()*/
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
    
    private func fadeInControls()
    {
        let actionFade:SKAction = SKAction.fadeIn(withDuration:kFadeInDuration)
        
        hud.run(actionFade)
        menu.run(actionFade)
        stop.run(actionFade)
    }
    
    private func transitionNextLevel()
    {/*
        let transition:SKTransition = SKTransition.crossFade(
            withDuration:kSceneTransitionDuration)
        let nextLevelScene:VOptionReformaCrossingScene = VOptionReformaCrossingScene(
            controller:controller)
        
        guard
            
            let view:SKView = self.view
            
        else
        {
            return
        }
        
        removeAllActions()
        view.presentScene(nextLevelScene, transition:transition)*/
    }
    
    //MARK: public
    
    func activateGame()
    {
         fadeInControls()
         
         labelTitle?.removeFromParent()
         controller.model.activateGame()
         player.startWalking()
    }
    
    
    
    func timeOut()
    {/*
        playSound(actionSound:soundFail)
        
        removeAction(forKey:kActionSpawn)
        player.timeOut()
        
        let reason:MOptionReformaCrossingGameOverTimeOut = MOptionReformaCrossingGameOverTimeOut()
        actionsGameOver(reason:reason)*/
    }
    
    func hitAndRun()
    {
        player.hitAndRun()
        
        let reason:MOptionReformaCrossingGameOverHitAndRun = MOptionReformaCrossingGameOverHitAndRun()
        actionsGameOver(reason:reason)
    }
    
    func gameSuccess()
    {/*
        playSound(actionSound:soundVictory)
        
        let actionDelay:SKAction = SKAction.wait(forDuration:kWaitTransition)
        let actionTransition:SKAction = SKAction.run(transitionNextLevel)
        let actions:[SKAction] = [
            actionDelay,
            actionTransition]
        let actionsSequence:SKAction = SKAction.sequence(actions)
        
        run(actionsSequence)*/
    }
    
    func createCoinOn(lane:MOptionReformaCrossingLane)
    {/*
        playSound(actionSound:soundCoin)
        
        let coin:MOptionReformaCrossingCoin = MOptionReformaCrossingCoin(
            lane:lane,
            controller:controller)
        
        addChild(coin)*/
    }
    
    //MARK: contact delegate
    
    func didBegin(_ contact:SKPhysicsContact)
    {
        contactBegin(contact:contact)
    }
}
