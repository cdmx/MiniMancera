import Foundation

class MOptionWhistlesVsZombiesStrategyGame:MGameStrategyMain<MOptionWhistlesVsZombies>
{
    init(model:MOptionWhistlesVsZombies)
    {
        let updateItems:[MGameUpdate<MOptionWhistlesVsZombies>] = [
            model.player,
            model.whistle,
            model.sonicBoom,
            model.zombie,
            model.points,
            model.contact,
            model.hud]
        
        super.init(
            model:model,
            updateItems:updateItems)
    }
}
