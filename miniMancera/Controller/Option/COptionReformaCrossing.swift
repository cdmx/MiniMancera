import UIKit
import SpriteKit

class COptionReformaCrossing:ControllerGame<MOptionReformaCrossing>
{
    override func viewWillDisappear(_ animated:Bool)
    {
        super.viewWillDisappear(animated)
        
        print("stop")
        stopTimer()
    }
    
    override func pause()
    {
        super.pause()
        
        stopTimer()
    }
    
    //MARK: private
    
    private func stopTimer()
    {
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
