import SpriteKit

class COptionReformaCrossing:ControllerGame<MOptionReformaCrossing>
{
    //MARK: public
    
    func newGameScene()
    {
        let newScene:VOptionReformaCrossingScene = VOptionReformaCrossingScene(
            controller:self)
        presentScene(newScene:newScene)
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
    
    func game1up()
    {
        let sound1up:SKAction = model.sounds.sound1up
        playSound(actionSound:sound1up)
        
        restartTimer()
        newGameScene()
        model.revertChanges()
    }
    
    func gamePlayNoMore()
    {
        let soundFail:SKAction = model.sounds.soundFail
        playSound(actionSound:soundFail)
        
        exitGame()
    }
    
    func playerStop()
    {
        if model.gameActive
        {
            guard
                
                let view:SKView = self.view as? SKView,
                let scene:VOptionReformaCrossingScene = view.scene as? VOptionReformaCrossingScene
                
            else
            {
                return
            }
            
            scene.player.stopWalking()
        }
    }
    
    
    
    
    
    
    
    
    func hitAndRun()
    {
        guard
            
            let view:SKView = self.view as? SKView,
            let scene:VOptionReformaCrossingScene = view.scene as? VOptionReformaCrossingScene
            
        else
        {
            return
        }
        
        model.hitAndRun()
        scene.hitAndRun()
    }
    
    
    
    func playerSuccess()
    {
        model.playerSuccess()
        
        guard
            
            let view:SKView = self.view as? SKView,
            let scene:VOptionReformaCrossingScene = view.scene as? VOptionReformaCrossingScene
            
        else
        {
            return
        }
        
        scene.gameSuccess()
    }
    
    func collectedLane(lane:MOptionReformaCrossingLane)
    {
        model.collectedLane()
        
        guard
            
            let view:SKView = self.view as? SKView,
            let scene:VOptionReformaCrossingScene = view.scene as? VOptionReformaCrossingScene
            
        else
        {
            return
        }
        
        scene.createCoinOn(lane:lane)
    }
}
