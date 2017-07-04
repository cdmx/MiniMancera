import Foundation

class MOptionWhistlesVsZombiesStrategyGame:MGameStrategyMain<MOptionWhistlesVsZombies>
{
    init(model:MOptionWhistlesVsZombies)
    {
        let updateItems:[MGameUpdate<MOptionWhistlesVsZombies>] = [
            model.whistle,
            model.sonicBoom]
        
        super.init(
            model:model,
            updateItems:updateItems)
    }
    
    //MARK: public
    
    func openBoardFor(base:MOptionWhistlesVsZombiesWhistleBase)
    {
        let strategy:MOptionWhistlesVsZombiesStrategyBoard = MOptionWhistlesVsZombiesStrategyBoard(
            model:model,
            base:base)
        
        model.boardStrategy(strategy:strategy)
    }
}
