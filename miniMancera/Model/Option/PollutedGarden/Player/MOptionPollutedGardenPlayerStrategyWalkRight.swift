import UIKit

class MOptionPollutedGardenPlayerStrategyWalkRight:MGameStrategy<
    MOptionPollutedGardenPlayer,
    MOptionPollutedGarden>
{
    private let kDirection:CGFloat = 1
    
    override init(model:MOptionPollutedGardenPlayer)
    {
        super.init(model:model)
        model.view?.xScale = kDirection
    }
    
    override func update(
        elapsedTime:TimeInterval,
        scene:ViewGameScene<MOptionPollutedGarden>)
    {
        if model.positionX < model.desiredPositionX
        {
            model.walk(
                direction:kDirection,
                elapsedTime:elapsedTime)
        }
        else
        {
            model.reachedPosition()
        }
    }
}
