import UIKit

class MOptionReformaCrossingLaneLeft:MOptionReformaCrossingLane
{
    private let kScaleHorizontal:CGFloat = -1
    private let kDirection:CGFloat = -1
    
    override var scaleHorizontal:CGFloat
    {
        get
        {
            return kScaleHorizontal
        }
    }
    
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
        let initialX:CGFloat = foeWidth_2 + sceneWidth
        let endingX:CGFloat = -foeWidth_2
        let foeSpeed:CGFloat = foe.randomSpeed() + addedSpeed
        
        let trip:MOptionReformaCrossingFoeItemTripLeft = MOptionReformaCrossingFoeItemTripLeft(
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
            let foeWidth_2:CGFloat = foe.texture.width_2
            let minWidth:CGFloat = sceneWidth - foeWidth_2
            
            if foe.trip.positionX > minWidth
            {
                return true
            }
        }
        
        return false
    }
}
