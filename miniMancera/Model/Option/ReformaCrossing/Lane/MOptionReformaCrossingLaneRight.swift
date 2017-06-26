import UIKit

class MOptionReformaCrossingLaneRight:MOptionReformaCrossingLane
{
    private let kScaleHorizontal:CGFloat = 1
    private let kDirection:CGFloat = 1
    
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
    
    override func foeInitialPoint(foe:VOptionReformaCrossingFoe) -> CGPoint
    {
        let horizontalPosition:CGFloat = foe.size.width / -2.0
        let point:CGPoint = CGPoint(x:horizontalPosition, y:verticalPosition)
        
        return point
    }
    
    override func foeEndingPoint(foe:VOptionReformaCrossingFoe) -> CGPoint
    {
        let foeWidth_2:CGFloat = foe.size.width / 2.0
        let horizontalPosition:CGFloat = foeWidth_2 + sceneWidth
        let point:CGPoint = CGPoint(x:horizontalPosition, y:verticalPosition)
        
        return point
    }
    
    override func hasFoeWaiting() -> Bool
    {
        for foe:MOptionReformaCrossingFoeItem in foes
        {
            let minWidth:CGFloat = foe.size.width / 2.0
            
            if foe.position.x <= minWidth
            {
                return true
            }
        }
        
        return false
    }
}
