import UIKit

class MOptionPollutedGardenControls:MGameUpdate<MOptionPollutedGarden>
{
    weak var view:VOptionPollutedGardenControls?
    
    override func update(
        elapsedTime:TimeInterval,
        scene:ViewGameScene<MOptionPollutedGarden>)
    {
        guard
            
            let positionX:CGFloat = view?.touchPositionX()
            
        else
        {
            return
        }
        
        scene.controller.model.player.walkToPoint(desiredPositionX:positionX)
    }
}
