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
    
    override func foeInitialPoint(foe:MOptionReformaCrossingFoe, sceneSize:CGSize) -> CGPoint
    {
        let sceneHeight_2:CGFloat = sceneSize.height / 2.0
        let verticalPosition:CGFloat = sceneHeight_2 + deltaVertical
        let foeWidth_2:CGFloat = foe.size.width / 2.0
        let horizontalPosition:CGFloat = foeWidth_2 + sceneSize.width
        let point:CGPoint = CGPoint(x:horizontalPosition, y:verticalPosition)
        
        return point
    }
    
    override func foeEndingPoint(foe:MOptionReformaCrossingFoe, sceneSize:CGSize) -> CGPoint
    {
        let sceneHeight_2:CGFloat = sceneSize.height / 2.0
        let verticalPosition:CGFloat = sceneHeight_2 + deltaVertical
        let horizontalPosition:CGFloat = foe.size.width / -2.0
        let point:CGPoint = CGPoint(x:horizontalPosition, y:verticalPosition)
        
        return point
    }
    
    override func hasFoeWaiting(sceneSize:CGSize) -> Bool
    {
        let sceneWidth:CGFloat = sceneSize.width
        
        for foe:MOptionReformaCrossingFoe in foes
        {
            let foeWidth_2:CGFloat = foe.size.width / 2.0
            let minWidth:CGFloat = sceneWidth - foeWidth_2
            
            if foe.position.x >= minWidth
            {
                return true
            }
        }
        
        return false
    }
}
