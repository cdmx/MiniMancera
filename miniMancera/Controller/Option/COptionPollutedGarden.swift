import UIKit
import SpriteKit

class COptionPollutedGarden:ControllerGame<MOptionPollutedGarden>
{
    //MARK: public
    
    func collectFlower(petunia:MOptionPollutedGardenPetunia)
    {
        guard
            
            let view:SKView = self.view as? SKView,
            let scene:MOptionPollutedGardenSceneGame = view.scene as? MOptionPollutedGardenSceneGame
            
        else
        {
            return
        }
        
        model.collectedFlower()
        scene.collectFlower(petunia:petunia)
    }
}
