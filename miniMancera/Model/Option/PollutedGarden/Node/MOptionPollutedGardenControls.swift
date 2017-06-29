import SpriteKit

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
    }
}
