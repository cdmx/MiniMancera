import UIKit

class MOptionWhistlesVsZombiesWhistleBase
{
    weak var view:VOptionWhistlesVsZombiesBase?
    private let positionX:CGFloat
    private let kPositionY:CGFloat = 100
    
    init(positionX:CGFloat)
    {
        self.positionX = positionX
    }
    
    //MARK: public
    
    func position() -> CGPoint
    {
        let point:CGPoint = CGPoint(
            x:positionX,
            y:kPositionY)
        
        return point
    }
    
    func showBoard() -> Bool
    {
        guard
        
            let _:UITouch = view?.lastTouch()
        
        else
        {
            return false
        }
        
        return true
    }
}
