import Foundation

class MOptionPollutedGardenPlantItemStrategyCollect:MGameStrategy<
    MOptionPollutedGardenPlantItem,
    MOptionPollutedGarden>
{
    private var elapsedTime:TimeInterval?
    private let kDelay:TimeInterval = 7.5
    
    override func update(
        elapsedTime:TimeInterval,
        scene:ViewGameScene<MOptionPollutedGarden>)
    {
        if let lastElapsedTime:TimeInterval = self.elapsedTime
        {
            let deltaTime:TimeInterval = elapsedTime - lastElapsedTime
            
            if deltaTime > kDelay
            {
                self.elapsedTime = elapsedTime
                model.collectFlower(scene:scene)
            }
        }
        else
        {
            self.elapsedTime = elapsedTime
        }
    }
}
