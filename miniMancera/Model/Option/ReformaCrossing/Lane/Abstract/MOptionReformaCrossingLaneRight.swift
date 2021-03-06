import UIKit

class MOptionReformaCrossingLaneRight:MOptionReformaCrossingLane
{
    private let kDirection:CGFloat = 1
    
    override var direction:CGFloat
    {
        get
        {
            return kDirection
        }
    }
    
    override func foeTrip(foe:MOptionReformaCrossingFoeItem) -> MOptionReformaCrossingFoeItemTrip?
    {
        foes.append(foe)
        
        let foeWidth_2:CGFloat = foe.texture.width_2
        let initialX:CGFloat = -foeWidth_2
        let endingX:CGFloat = foeWidth_2 + sceneWidth
        let foeSpeed:CGFloat = foe.randomSpeed() + addedSpeed
        
        let trip:MOptionReformaCrossingFoeItemTripRight = MOptionReformaCrossingFoeItemTripRight(
            speed:foeSpeed,
            initialX:initialX,
            endingX:endingX,
            positionY:positionY)
        
        return trip
    }
    
    override func hasFoeWaiting() -> Bool
    {
        for foe:MOptionReformaCrossingFoeItem in foes
        {
            let minWidth:CGFloat = foe.texture.width_2
            
            if foe.trip.positionX < minWidth
            {
                return true
            }
        }
        
        return false
    }
}
