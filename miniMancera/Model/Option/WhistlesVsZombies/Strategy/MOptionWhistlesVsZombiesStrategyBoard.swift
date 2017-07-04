import UIKit

class MOptionWhistlesVsZombiesStrategyBoard:MGameStrategyMain<MOptionWhistlesVsZombies>
{
    private weak var base:MOptionWhistlesVsZombiesWhistleBase!
    
    init(
        model:MOptionWhistlesVsZombies,
        base:MOptionWhistlesVsZombiesWhistleBase)
    {
        self.base = base
        
        super.init(
            model:model,
            updateItems:[])
        
        model.board.show(model:model)
    }
    
    override func update(
        elapsedTime:TimeInterval,
        scene:ViewGameScene<MOptionWhistlesVsZombies>)
    {
        super.update(
            elapsedTime:elapsedTime,
            scene:scene)
        
        checkCancel(scene:scene)
    }
    
    //MARK: private
    
    private func closeBoard()
    {
        model.board.hide(model:model)
        model.strategyGame()
    }
    
    private func checkCancel(scene:ViewGameScene<MOptionWhistlesVsZombies>)
    {
        guard
            
            let _:UITouch = model.board.view.cancel.lastTouch()
            
        else
        {
            checkWhistles(scene:scene)
            
            return
        }
        
        closeBoard()
    }
    
    private func checkWhistles(scene:ViewGameScene<MOptionWhistlesVsZombies>)
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
            
            whistleSelected(type:type, scene:scene)
            
            break
        }
    }
    
    private func whistleSelected(
        type:MOptionWhistlesVsZombiesWhistleType,
        scene:ViewGameScene<MOptionWhistlesVsZombies>)
    {
        guard
            
            let scene:VOptionWhistlesVsZombiesScene = scene as? VOptionWhistlesVsZombiesScene
        
        else
        {
            return
        }
        
        base.charge(whistleType:type)
        scene.addWhistle(base:base)
        closeBoard()
    }
}
