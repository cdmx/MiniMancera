import SpriteKit

class COptionReformaCrossing:ControllerGame<MOptionReformaCrossing>
{
    override func notifiedEnterBackground(sender notification:Notification)
    {
        stopTimer()
    }
    
    //MARK: public
    
    func playerStop()
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
        
        postScore()
    }
    
    func game1up()
    {
        guard
            
            let view:SKView = self.view as? SKView,
            let scene:VOptionReformaCrossingSceneOver = view.scene as? VOptionReformaCrossingSceneOver
            
        else
        {
            return
        }
        
        model.revertChanges()
        scene.game1up()
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
