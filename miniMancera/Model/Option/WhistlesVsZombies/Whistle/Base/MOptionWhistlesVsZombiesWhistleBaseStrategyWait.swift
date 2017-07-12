import UIKit

class MOptionWhistlesVsZombiesWhistleBaseStrategyWait:MGameStrategy<
    MOptionWhistlesVsZombiesWhistleBase,
    MOptionWhistlesVsZombies>
{
    override func update(
        elapsedTime:TimeInterval,
        scene:ViewGameScene<MOptionWhistlesVsZombies>)
    {
        guard
            
            let _:UITouch = self.model.viewBase?.lastTouch(),
            let controller:COptionWhistlesVsZombies = scene.controller as? COptionWhistlesVsZombies
            
        else
        {
            return
        }
        
        controller.showBoard(modelBase:model)
    }
}
