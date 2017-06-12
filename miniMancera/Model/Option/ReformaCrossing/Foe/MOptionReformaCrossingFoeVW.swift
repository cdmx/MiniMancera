import UIKit

class MOptionReformaCrossingFoeVW:MOptionReformaCrossingFoe
{
    private let kMinSpeed:CGFloat = 20
    private let kRandomMaxSpeed:UInt32 = 60

    override var randomMaxSpeed:UInt32
    {
        get
        {
            return kRandomMaxSpeed
        }
    }
    
    override var minSpeed:CGFloat
    {
        get
        {
            return kMinSpeed
        }
    }
}
