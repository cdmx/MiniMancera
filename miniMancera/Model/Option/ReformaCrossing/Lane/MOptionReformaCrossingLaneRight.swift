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
    
    override func foeInitialX(foeWidth_2:CGFloat) -> CGFloat
    {
        return foeWidth_2
    }
    
    override func foeEndingX(foeWidth_2:CGFloat) -> CGFloat
    {
        let position:CGFloat = foeWidth_2 + sceneWidth
        
        return position
    }
    
    override func hasFoeWaiting() -> Bool
    {
        for foe:MOptionReformaCrossingFoeItem in foes
        {/*
            let minWidth:CGFloat = foe.size.width / 2.0
            
            if foe.position.x <= minWidth
            {
                return true
            }*/
        }
        
        return false
    }
}
