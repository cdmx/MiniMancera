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
        self.speed = speed
        self.initialX = initialX
        self.endingX = endingX
        self.positionY = positionY
    }
}
