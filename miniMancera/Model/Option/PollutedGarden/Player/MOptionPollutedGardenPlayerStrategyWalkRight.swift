import UIKit

class MOptionPollutedGardenPlayerStrategyWalkRight:MOptionPollutedGardenPlayerStrategyWalk
{
    private let kDirection:CGFloat = 1
    
    init(model:MOptionPollutedGardenPlayer)
    {
        super.init(model:model, direction:kDirection)
    }
    
    override func reachedPosition() -> Bool
    {
        return model.positionX > model.desiredPositionX
    }
}
