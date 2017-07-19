import SpriteKit

class COptionTamalesOaxaquenos:ControllerGame<MOptionTamalesOaxaquenos>
{
    override func didBegin(_ contact:SKPhysicsContact)
    {
        model.contact.addContact(contact:contact)
    }
    
    override func game1up()
    {
        super.game1up()
        
//        let sound1up:SKAction = model.sounds.sound1up
//        playSound(actionSound:sound1up)
        
        newGameScene()
    }
    
    private func newGameScene()
    {
        presentNewGameScene()
        model.startLevel()
    }
    
    private func presentNewGameScene()
    {
        let newScene:VOptionTamalesOaxaquenosScene = VOptionTamalesOaxaquenosScene(
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
        
        let newScene:VOptionTamalesOaxaquenosSceneOver = VOptionTamalesOaxaquenosSceneOver(
            controller:self)
        
        presentScene(newScene:newScene)
    }
    
    func showFinish()
    {
        postScore()
        model.generateLevel()
        presentNewGameScene()
    }
    
    func playerInHole()
    {
//        let soundHorror:SKAction = model.sounds.soundHorror
//        playSound(actionSound:soundHorror)
        
        model.playerInHole()
    }
    
    func playerFinish()
    {
//        let soundHorror:SKAction = model.sounds.soundHorror
//        playSound(actionSound:soundHorror)
        
        model.playerFinish()
    }
}
