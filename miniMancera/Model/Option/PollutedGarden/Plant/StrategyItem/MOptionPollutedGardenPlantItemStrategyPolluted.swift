import Foundation

class MOptionPollutedGardenPlantItemStrategyPolluted:MGameStrategy<
    MOptionPollutedGardenPlantItem,
    MOptionPollutedGarden>
{
    private var elapsedTime:TimeInterval?
    private let kDelay:TimeInterval = 4
    
    override func update(
        elapsedTime:TimeInterval,
        scene:ViewGameScene<MOptionPollutedGarden>)
    {
        if let startTime:TimeInterval = self.elapsedTime
        {
            let deltaTime:TimeInterval = elapsedTime - startTime
            
            if deltaTime > kDelay
            {
                model.grow()
            }
        }
        else
        {
            self.elapsedTime = elapsedTime
            model.viewPlant?.polluted()
        }
    }
}
