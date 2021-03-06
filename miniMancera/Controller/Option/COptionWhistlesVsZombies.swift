import SpriteKit

class COptionWhistlesVsZombies:ControllerGame<MOptionWhistlesVsZombies>
{
    override func viewWillAppear(_ animated:Bool)
    {
        super.viewWillAppear(animated)
        
        guard
            
            let parent:ControllerParent = parent as? ControllerParent
            
        else
        {
            return
        }
        
        if parent.supportedInterfaceOrientations != UIInterfaceOrientationMask.landscape
        {
            parent.landscapeOrientation()
        }
    }
    
    override func exitGame()
    {
        guard
            
            let parent:ControllerParent = parent as? ControllerParent
            
        else
        {
            return
        }
        
        parent.portraitOrientation()
        
        super.exitGame()
    }
    
    override func didBegin(_ contact:SKPhysicsContact)
    {
        model.contact.addContact(contact:contact)
    }
    
    override func game1up()
    {
        super.game1up()
        
        let sound1up:SKAction = model.sounds.sound1up
        playSound(actionSound:sound1up)
        
        newGameScene()
    }
    
    override func gamePlayNoMore()
    {
        let soundFail:SKAction = model.sounds.soundFail
        playSound(actionSound:soundFail)
        
        super.gamePlayNoMore()
    }
    
    //MARK: private
    
    private func asyncShowBoard(modelBase:MOptionWhistlesVsZombiesWhistleBase)
    {
        guard
            
            let parent:ControllerParent = self.parent as? ControllerParent
            
        else
        {
            return
        }
        
        let controller:COptionWhistlesVsZombiesBoard = COptionWhistlesVsZombiesBoard(
            controllerGame:self,
            modelBase:modelBase)
        parent.animateOver(controller:controller)
    }
    
    private func newGameScene()
    {
        let newScene:VOptionWhistlesVsZombiesScene = VOptionWhistlesVsZombiesScene(
            controller:self)
        presentScene(newScene:newScene)
        
        model.startLevel()
    }
    
    private func presentScene(newScene:SKScene)
    {
        let transition:SKTransition = model.actions.transitionCrossFade
        
        guard
            
            let view:SKView = self.view as? SKView
            
        else
        {
            return
        }
        
        view.presentScene(newScene, transition:transition)
    }
    
    //MARK: public
    
    func showBoard(modelBase:MOptionWhistlesVsZombiesWhistleBase)
    {
        DispatchQueue.main.async
        { [weak self] in
            
            self?.asyncShowBoard(modelBase:modelBase)
        }
    }
    
    func showGameOver()
    {
        model.strategyWait()
        postScore()
        
        let newScene:VOptionWhistlesVsZombiesSceneOver = VOptionWhistlesVsZombiesSceneOver(
            controller:self)
        
        presentScene(newScene:newScene)
    }
    
    func zombiesGotHome()
    {
        let soundHorror:SKAction = model.sounds.soundHorror
        playSound(actionSound:soundHorror)
        
        model.zombiesGotHome()
    }
}
