import Foundation

class MOptionPollutedGardenPlantCollectStrategyWait:MGameStrategy<
    MOptionPollutedGardenPlantCollect,
    MOptionPollutedGarden>
{
    private var elapsedTime:TimeInterval?
    private let kDelay:TimeInterval = 0.3
    
    override func update(
        elapsedTime:TimeInterval,
        scene:ViewGameScene<MOptionPollutedGarden>)
    {
        if let startTime:TimeInterval = self.elapsedTime
        {
            let deltaTime:TimeInterval = elapsedTime - startTime
            
            if deltaTime > kDelay
            {
                model.fade()
            }
        }
        else
        {
            self.elapsedTime = elapsedTime
            
            guard
                
                let scene:VOptionPollutedGardenScene = scene as? VOptionPollutedGardenScene
                
            else
            {
                return
            }
            
            scene.addCollect(model:model)
        }
    }
}
