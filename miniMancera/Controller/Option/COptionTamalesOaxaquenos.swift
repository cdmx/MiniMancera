import SpriteKit

class COptionTamalesOaxaquenos:ControllerGame<MOptionTamalesOaxaquenos>
{
    override func didBegin(_ contact:SKPhysicsContact)
    {
        model.contact.addContact(contact:contact)
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
        
        let newScene:VOptionTamalesOaxaquenosSceneOver = VOptionTamalesOaxaquenosSceneOver(
            controller:self)
        
        presentScene(newScene:newScene)
    }
    
    func playerInHole()
    {
//        let soundHorror:SKAction = model.sounds.soundHorror
//        playSound(actionSound:soundHorror)
        
        model.playerInHole()
    }
}
