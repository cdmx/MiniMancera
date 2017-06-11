import UIKit

class MOptionReformaCrossingLaneLeft:MOptionReformaCrossingLaneProtocol
{
    private let verticalPosition:CGFloat
    
    init(verticalPosition:CGFloat)
    {
        self.verticalPosition = verticalPosition
    }
    
    //MARK: lane protocol
    
    func foeInitialPoint(foe:MOptionReformaCrossingFoe, sceneSize:CGSize) -> CGPoint
    {
        let foeWidth_2:CGFloat = foe.size.width / 2.0
        let horizontalPosition:CGFloat = foeWidth_2 + sceneSize.width
        let point:CGPoint = CGPoint(x:horizontalPosition, y:verticalPosition)
        
        return point
    }
    
    func foeEndingPoint(foe:MOptionReformaCrossingFoe, sceneSize:CGSize) -> CGPoint
    {
        let horizontalPosition:CGFloat = foe.size.width / 2.0
        let point:CGPoint = CGPoint(x:horizontalPosition, y:verticalPosition)
        
        return point
    }
}
