import UIKit

class MOptionWhistlesVsZombiesBaseItem
{
    let positionX:CGFloat
    let positionY:CGFloat
    weak var view:VOptionWhistlesVsZombiesBase?
    
    init(positionX:CGFloat, positionY:CGFloat)
    {
        self.positionX = positionX
        self.positionY = positionY
    }
}
