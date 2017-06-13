import UIKit
import SpriteKit

class COptionReformaCrossing:ControllerGame<MOptionReformaCrossing>
{
    override func pause()
    {
        super.pause()
        
        guard
            
            let view:SKView = self.view as? SKView,
            let scene:MOptionReformaCrossingSceneGame = view.scene as? MOptionReformaCrossingSceneGame
            
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
            let scene:MOptionReformaCrossingSceneGame = view.scene as? MOptionReformaCrossingSceneGame
        
        else
        {
            return
        }
        
        scene.player.stopWalking()
    }
}
