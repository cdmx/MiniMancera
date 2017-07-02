import UIKit

class MOptionReformaCrossingFoeItemTripRight:MOptionReformaCrossingFoeItemTrip
{
    override func advanceWithDelta(delta:CGFloat)
    {
        let move:CGFloat = delta * speed
        positionX += move
    }
    
    override func reachedDestination() -> Bool
    {
        return positionX > endingX
    }
}
