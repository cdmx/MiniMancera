import UIKit

class MOptionReformaCrossingFoeItemCyclerFemale:MOptionReformaCrossingFoeItem
{
    private let kRandomMaxSpeed:UInt32 = 10
    
    override var randomMaxSpeed:UInt32
    {
        get
        {
            return kRandomMaxSpeed
        }
    }
}
