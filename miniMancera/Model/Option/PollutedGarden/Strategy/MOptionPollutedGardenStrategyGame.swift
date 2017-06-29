import SpriteKit

class MOptionPollutedGardenStrategyGame:MGameStrategyMain<MOptionPollutedGarden>
{
    init(model:MOptionPollutedGarden)
    {
        let updateItems:[MGameUpdateProtocol] = [
            ]
        
        super.init(model:model, updateItems:updateItems)
    }
}
