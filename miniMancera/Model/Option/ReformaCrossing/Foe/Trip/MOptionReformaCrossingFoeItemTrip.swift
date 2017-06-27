import UIKit

class MOptionReformaCrossingFoeItemTrip
{
    var positionX:CGFloat
    let speed:CGFloat
    let initialX:CGFloat
    let endingX:CGFloat
    let positionY:CGFloat
    private var lastElapsedTime:TimeInterval?
    
    init(
        speed:CGFloat,
        initialX:CGFloat,
        endingX:CGFloat,
        positionY:CGFloat)
    {
        positionX = initialX
        self.initialX = initialX
        self.endingX = endingX
        self.positionY = positionY
        self.speed = speed
    }
    
    //MARK: public
    
    func advance(elapsedTime:TimeInterval)
    {
        if let lastElapsedTime:TimeInterval = self.lastElapsedTime
        {
            let deltaTime:TimeInterval = elapsedTime - lastElapsedTime
            let delta:CGFloat = CGFloat(deltaTime)
            advanceWithDelta(delta:delta)
        }
        
        lastElapsedTime = elapsedTime
    }
    
    func advanceWithDelta(delta:CGFloat)
    {
        
    }
    
    func reachedDestination() -> Bool
    {
        return false
    }
}
