import UIKit

class MOptionReformaCrossingFoeVW:MOptionReformaCrossingFoe
{
    private let kRandomMaxSpeed:UInt32 = 60

    override var randomMaxSpeed:UInt32
    {
        get
        {
            return kRandomMaxSpeed
        }
    }
}
