import Foundation

class MOptionPollutedGardenStrategyGame:MGameStrategyMain<MOptionPollutedGarden>
{
    init(model:MOptionPollutedGarden)
    {
        let updateItems:[MGameUpdate<MOptionPollutedGarden>] = [
            model.controls,
            model.plant,
            model.bubble,
            model.player,
            model.hud,
            model.contact]
        
        super.init(model:model, updateItems:updateItems)
    }
}
