import Foundation

class MOptionPollutedGardenStrategyEnd:MGameStrategyMain<MOptionPollutedGarden>
{
    private var initialTime:TimeInterval?
    private let kWait:TimeInterval = 1.5
    
    init(model:MOptionPollutedGarden)
    {
        let updateItems:[MGameUpdate<MOptionPollutedGarden>] = [
            model.bubble,
            model.hud,
            model.contact]
        
        super.init(model:model, updateItems:updateItems)
    }
    
    override func update(
        elapsedTime:TimeInterval,
        scene:ViewGameScene<MOptionPollutedGarden>)
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
