import SpriteKit

class MOptionReformaCrossingStrategyGame:MGameStrategyMain<MOptionReformaCrossing>
{
    init(model:MOptionReformaCrossing)
    {
        let updateItems:[MGameUpdateProtocol] = [
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
