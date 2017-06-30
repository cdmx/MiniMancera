import Foundation

class MOptionPollutedGardenStrategyGame:MGameStrategyMain<MOptionPollutedGarden>
{
    init(model:MOptionPollutedGarden)
    {
        let updateItems:[MGameUpdate<MOptionPollutedGarden>] = [
            model.controls,
            model.plant,
            model.bubble,
            model.player]
        
        super.init(model:model, updateItems:updateItems)
    }
}
