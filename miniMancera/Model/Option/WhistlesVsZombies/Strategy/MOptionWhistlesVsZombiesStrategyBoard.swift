import UIKit

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
    
    override func update(
        elapsedTime:TimeInterval,
        scene:ViewGameScene<MOptionWhistlesVsZombies>)
    {
        super.update(
            elapsedTime:elapsedTime,
            scene:scene)
        
        guard
        
            let _:UITouch = model.board.view.cancel.lastTouch()
        
        else
        {
            return
        }
        
        model.board.hide(model:model)
        model.strategyGame()
    }
}
