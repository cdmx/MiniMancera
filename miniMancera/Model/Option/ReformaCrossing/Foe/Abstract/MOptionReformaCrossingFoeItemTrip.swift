import UIKit

class MOptionReformaCrossingFoeItemTrip
{
    var positionX:CGFloat
    let speed:CGFloat
    let initialX:CGFloat
    let endingX:CGFloat
    let positionY:CGFloat
    
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
        
        if endingX > initialX
        {
            self.speed = speed
        }
        else
        {
            self.speed = -speed
        }
    }
}
