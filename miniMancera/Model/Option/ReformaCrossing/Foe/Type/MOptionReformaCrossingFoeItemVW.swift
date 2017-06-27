import UIKit

class MOptionReformaCrossingFoeItemVW:MOptionReformaCrossingFoeItem
{
    private let kRandomMaxSpeed:UInt32 = 30
    
    override var randomMaxSpeed:UInt32
    {
        get
        {
            return kRandomMaxSpeed
        }
    }
}
