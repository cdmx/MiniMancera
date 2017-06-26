import SpriteKit

class VOptionReformaCrossingScene:ViewGameScene<MOptionReformaCrossing>
{
    weak var player:VOptionReformaCrossingPlayer!
    weak var stop:VOptionReformaCrossingStop!
    weak var menu:VOptionReformaCrossingMenu!
    weak var labelTitle:SKLabelNode?
    private let kWaitTransition:TimeInterval = 1.5
    private let kSceneTransitionDuration:TimeInterval = 1
    private let kSpawnFoeRate:TimeInterval = 0.1
    private let kTitleDuration:TimeInterval = 1.5
    private let kSpawnProbability:UInt32 = 6
    
    required init(controller:ControllerGame<MOptionReformaCrossing>)
    {
        controller.model.startLevel()
        
        super.init(controller:controller)
        physicsWorld.gravity = CGVector.zero
        physicsWorld.contactDelegate = self

        factoryNodes()
        
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
         labelTitle?.removeFromParent()
//         player.startWalking()
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
