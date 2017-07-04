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
            
            let _:UITouch = self.model.viewBase?.lastTouch()
            
        else
        {
            return
        }
        
        let model:MOptionWhistlesVsZombies = scene.controller.model
        model.openBoardFor(base:self.model)
    }
}
