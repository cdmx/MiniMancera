import Foundation

class MOptionWhistlesVsZombiesStrategyBoard:MGameStrategyMain<MOptionWhistlesVsZombies>
{
    private weak var view:VOptionWhistlesVsZombiesBoard?
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
    }
    
    override func update(
        elapsedTime:TimeInterval,
        scene:ViewGameScene<MOptionWhistlesVsZombies>)
    {
        super.update(
            elapsedTime:elapsedTime,
            scene:scene)
        
        if view == nil
        {
            guard
            
                let scene:VOptionWhistlesVsZombiesScene = scene as? VOptionWhistlesVsZombiesScene
            
            else
            {
                return
            }
            
            view = scene.showBoard()
        }
    }
}
