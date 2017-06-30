import Foundation

class MOptionReformaCrossingStrategyGame:MGameStrategyMain<MOptionReformaCrossing>
{
    init(model:MOptionReformaCrossing)
    {
        let updateItems:[MGameUpdate<MOptionReformaCrossing>] = [
            model.stop,
            model.hud,
            model.player,
            model.laneGroup,
            model.foe,
            model.coin,
            model.contact]
        
        super.init(model:model, updateItems:updateItems)
    }
}
