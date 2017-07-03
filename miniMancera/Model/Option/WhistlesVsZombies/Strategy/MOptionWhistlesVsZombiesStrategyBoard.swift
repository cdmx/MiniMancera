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
        
        checkCancel()
    }
    
    //MARK: private
    
    private func closeBoard()
    {
        model.board.hide(model:model)
        model.strategyGame()
    }
    
    private func checkCancel()
    {
        guard
            
            let _:UITouch = model.board.view.cancel.lastTouch()
            
        else
        {
            checkWhistles()
            
            return
        }
        
        closeBoard()
    }
    
    private func checkWhistles()
    {
        let types:[MOptionWhistlesVsZombiesWhistleType] = model.whistle.types
        
        for type:MOptionWhistlesVsZombiesWhistleType in types
        {
            guard
            
                let _:UITouch = type.view?.lastTouch()
            
            else
            {
                continue
            }
            
            base.charge(whistleType:type)
            closeBoard()
            
            break
        }
    }
}
