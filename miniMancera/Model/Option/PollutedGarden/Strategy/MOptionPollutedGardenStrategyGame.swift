import SpriteKit

class MOptionPollutedGardenStrategyGame:MGameStrategyMain<MOptionPollutedGarden>
{
    init(model:MOptionPollutedGarden)
    {
        let updateItems:[MGameUpdate<MOptionPollutedGarden>] = [
            ]
        
        super.init(model:model, updateItems:updateItems)
    }
}
