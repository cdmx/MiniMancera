import UIKit

class MOptionReformaCrossingFoeItemLordAudi:MOptionReformaCrossingFoeItem
{
    private let kRandomMaxSpeed:UInt32 = 120
    
    override var randomMaxSpeed:UInt32
    {
        get
        {
            return kRandomMaxSpeed
        }
    }
}
