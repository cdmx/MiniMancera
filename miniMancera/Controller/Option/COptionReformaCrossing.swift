import SpriteKit

class COptionReformaCrossing:ControllerGame<MOptionReformaCrossing>
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
        
        model.revertChanges()
        newGameScene()
    }
    
    override func gamePlayNoMore()
    {
        let soundFail:SKAction = model.sounds.soundFail
        playSound(actionSound:soundFail)
        
        super.gamePlayNoMore()
    }
    
    //MARK: private
    
    private func newGameScene()
    {
        let newScene:VOptionReformaCrossingScene = VOptionReformaCrossingScene(
            controller:self)
        presentScene(newScene:newScene)
        
        model.startLevel()
    }
    
    //MARK: public
    
    func nextLevel()
    {
        restartTimer()
        newGameScene()
    }
    
    func presentScene(newScene:SKScene)
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
    
    func showGameOver()
    {
        model.strategyWait()
        postScore()
    }
}
