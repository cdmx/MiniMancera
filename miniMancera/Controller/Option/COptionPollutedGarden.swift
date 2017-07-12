import SpriteKit

class COptionPollutedGarden:ControllerGame<MOptionPollutedGarden>
{
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
    
    //MAKR: private
    
    private func newGameScene()
    {
        let newScene:VOptionPollutedGardenScene = VOptionPollutedGardenScene(
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
    
    func showGameOver()
    {
        model.strategyWait()
        postScore()
        
        let newScene:VOptionPollutedGardenSceneOver = VOptionPollutedGardenSceneOver(
            controller:self)
        
        presentScene(newScene:newScene)
    }
}
