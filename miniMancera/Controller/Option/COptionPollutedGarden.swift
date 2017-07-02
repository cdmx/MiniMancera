import SpriteKit

class COptionPollutedGarden:ControllerGame<MOptionPollutedGarden>
{
    override func didBegin(_ contact:SKPhysicsContact)
    {
        model.contact.addContact(contact:contact)
    }
    
    //MAKR: private
    
    private func newGameScene()
    {
        let newScene:VOptionPollutedGardenScene = VOptionPollutedGardenScene(
            controller:self)
        presentScene(newScene:newScene)
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
    
    func showGameOver()
    {
        model.strategyWait()
        postScore()
        
        let newScene:VOptionPollutedGardenSceneOver = VOptionPollutedGardenSceneOver(
            controller:self)
        
        presentScene(newScene:newScene)
    }
    
    func game1up()
    {
        let sound1up:SKAction = model.sounds.sound1up
        playSound(actionSound:sound1up)
        
        model.revertChanges()
        restartTimer()
        newGameScene()
    }
    
    func gamePlayNoMore()
    {
        let soundFail:SKAction = model.sounds.soundFail
        playSound(actionSound:soundFail)
        
        exitGame()
    }
}
