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
    
    override func foeInitialX(foeWidth_2:CGFloat) -> CGFloat
    {
        let position:CGFloat = foeWidth_2 + sceneWidth
        
        return position
    }
    
    override func foeEndingX(foeWidth_2:CGFloat) -> CGFloat
    {
        return foeWidth_2
    }
    
    override func hasFoeWaiting() -> Bool
    {   
        for foe:MOptionReformaCrossingFoeItem in foes
        {
            let foeWidth_2:CGFloat = foe.texture.size.width / 2.0
            let minWidth:CGFloat = sceneWidth - foeWidth_2
            /*
            if foe.position.x >= minWidth
            {
                return true
            }*/
        }
        
        return false
    }
}
