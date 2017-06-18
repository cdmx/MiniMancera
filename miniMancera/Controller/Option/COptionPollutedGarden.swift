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
    
    func pollutedFlower(petunia:MOptionPollutedGardenPetunia)
    {
        guard
            
            let view:SKView = self.view as? SKView,
            let scene:MOptionPollutedGardenSceneGame = view.scene as? MOptionPollutedGardenSceneGame
            
        else
        {
            return
        }
        
        scene.flowerPolluted(petunia:petunia)
        
        if model.score > 0
        {
            model.pollutedFlower()
        }
        else
        {
            model.allFlowersPolluted()
        }
    }
}
