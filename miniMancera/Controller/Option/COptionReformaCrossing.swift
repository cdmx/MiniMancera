import UIKit
import SpriteKit

class COptionReformaCrossing:ControllerGame<MOptionReformaCrossing>
{
    override func pause()
    {
        super.pause()
        
        stopTimer()
    }
    
    override func notifiedEnterBackground(sender notification:Notification)
    {
        stopTimer()
    }
    
    //MARK: private
    
    private func stopTimer()
    {
        guard
            
            let view:SKView = self.view as? SKView,
            let scene:VOptionReformaCrossingScene = view.scene as? VOptionReformaCrossingScene
            
        else
        {
            return
        }
        
        scene.lastUpdateTime = nil
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
    
    func timeOut()
    {
        guard
            
            let view:SKView = self.view as? SKView,
            let scene:VOptionReformaCrossingScene = view.scene as? VOptionReformaCrossingScene
            
        else
        {
            return
        }
        
        model.stopAll()
        scene.timeOut()
        
        postScore()
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
