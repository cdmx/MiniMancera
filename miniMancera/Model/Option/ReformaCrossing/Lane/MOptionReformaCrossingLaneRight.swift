import UIKit

class MOptionReformaCrossingLaneRight:MOptionReformaCrossingLaneProtocol
{
    private let deltaVertical:CGFloat
    
    init(deltaVertical:CGFloat)
    {
        self.deltaVertical = deltaVertical
    }
    
    //MARK: lane protocol
    
    func foeInitialPoint(foe:MOptionReformaCrossingFoe, sceneSize:CGSize) -> CGPoint
    {
        let sceneHeight_2:CGFloat = sceneSize.height / 2.0
        let verticalPosition:CGFloat = sceneHeight_2 + deltaVertical
        let horizontalPosition:CGFloat = foe.size.width / 2.0
        let point:CGPoint = CGPoint(x:horizontalPosition, y:verticalPosition)
        
        return point
    }
    
    func foeEndingPoint(foe:MOptionReformaCrossingFoe, sceneSize:CGSize) -> CGPoint
    {
        let sceneHeight_2:CGFloat = sceneSize.height / 2.0
        let verticalPosition:CGFloat = sceneHeight_2 + deltaVertical
        let foeWidth_2:CGFloat = foe.size.width / 2.0
        let horizontalPosition:CGFloat = foeWidth_2 + sceneSize.width
        let point:CGPoint = CGPoint(x:horizontalPosition, y:verticalPosition)
        
        return point
    }
}
