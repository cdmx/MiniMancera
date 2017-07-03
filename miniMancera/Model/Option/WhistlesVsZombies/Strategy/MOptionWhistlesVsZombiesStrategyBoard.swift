import Foundation

class MOptionWhistlesVsZombiesStrategyBoard:MGameStrategyMain<MOptionWhistlesVsZombies>
{
    private weak var base:MOptionWhistlesVsZombiesWhistleBase!
    
    init(
        model:MOptionWhistlesVsZombies,
        base:MOptionWhistlesVsZombiesWhistleBase)
    {
        self.base = base
        let updateItems:[MGameUpdate<MOptionWhistlesVsZombies>] = []
        
        super.init(
            model:model,
            updateItems:updateItems)
        
        model.board.show(model:model)
    }
}
