import SpriteKit

class MOptionPollutedGardenStrategyEnd:MGameStrategyMain<MOptionPollutedGarden>
{
    private var initialTime:TimeInterval?
    private let kWait:TimeInterval = 1.5
    
    init(model:MOptionPollutedGarden)
    {
        let updateItems:[MGameUpdateProtocol] = [
            ]
        
        super.init(model:model, updateItems:updateItems)
    }
    
    override func update(
        elapsedTime:TimeInterval,
        scene:SKScene)
    {
        if let initialTime:TimeInterval = self.initialTime
        {
            let deltaTime:TimeInterval = elapsedTime - initialTime
            
            if deltaTime > kWait
            {
                
            }
        }
        else
        {
            self.initialTime = elapsedTime
        }
    }
}
