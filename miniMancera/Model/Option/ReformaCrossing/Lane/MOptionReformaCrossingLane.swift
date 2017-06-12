import UIKit

class MOptionReformaCrossingLane:MOptionReformaCrossingLaneProtocol
{
    var foes:[MOptionReformaCrossingFoe]
    let deltaVertical:CGFloat
    
    init(deltaVertical:CGFloat)
    {
        self.deltaVertical = deltaVertical
        foes = []
    }
    
    //MARK: public
    
    func foeInitialPoint(foe:MOptionReformaCrossingFoe, sceneSize:CGSize) -> CGPoint
    {
        return CGPoint.zero
    }
    
    func foeEndingPoint(foe:MOptionReformaCrossingFoe, sceneSize:CGSize) -> CGPoint
    {
        return CGPoint.zero
    }
    
    func hasFoeWaiting() -> Bool
    {
        return false
    }
    
    //MARK: lane protocol
    
    var scaleHorizontal:CGFloat
    {
        get
        {
            return 0
        }
    }
    
    var direction:CGFloat
    {
        get
        {
            return 0
        }
    }
}
