import UIKit

class MOptionPollutedGardenPlayerStrategyWalk:MGameStrategy<
    MOptionPollutedGardenPlayer,
    MOptionPollutedGarden>
{
    private var lastElapsedTime:TimeInterval?
    private let direction:CGFloat
    
    init(model:MOptionPollutedGardenPlayer, direction:CGFloat)
    {
        self.direction = direction
        super.init(model:model)
        model.view?.xScale = direction
    }
    
    override func update(
        elapsedTime:TimeInterval,
        scene:ViewGameScene<MOptionPollutedGarden>)
    {
        if let lastElapsedTime:TimeInterval = self.lastElapsedTime
        {
            let deltaTime:TimeInterval = elapsedTime - lastElapsedTime
            let reached:Bool = reachedPosition()
            
            if reached
            {
                model.reachedPosition()
            }
            else
            {
                model.walk(
                    direction:direction,
                    elapsedTime:deltaTime)
            }
        }
        
        lastElapsedTime = elapsedTime
    }
    
    //MARK: public
    
    func reachedPosition() -> Bool
    {
        return false
    }
}
