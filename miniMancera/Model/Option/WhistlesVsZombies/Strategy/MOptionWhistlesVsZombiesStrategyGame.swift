import Foundation

class MOptionWhistlesVsZombiesStrategyGame:MGameStrategyMain<MOptionWhistlesVsZombies>
{
    init(model:MOptionWhistlesVsZombies)
    {
        let updateItems:[MGameUpdate<MOptionWhistlesVsZombies>] = [
            model.whistle,
            model.sonicBoom,
            model.contact]
        
        super.init(
            model:model,
            updateItems:updateItems)
    }
}
