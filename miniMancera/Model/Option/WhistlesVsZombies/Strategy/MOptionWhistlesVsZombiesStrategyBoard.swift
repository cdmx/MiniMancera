import Foundation

class MOptionWhistlesVsZombiesStrategyBoard:MGameStrategyMain<MOptionWhistlesVsZombies>
{
    init(model:MOptionWhistlesVsZombies)
    {
        let updateItems:[MGameUpdate<MOptionWhistlesVsZombies>] = []
        
        super.init(
            model:model,
            updateItems:updateItems)
    }
}
