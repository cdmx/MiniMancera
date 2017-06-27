import UIKit

class MOptionReformaCrossingFoeItemTaxiPink:MOptionReformaCrossingFoeItem
{
    private let kRandomMaxSpeed:UInt32 = 40
    
    override var randomMaxSpeed:UInt32
    {
        get
        {
            return kRandomMaxSpeed
        }
    }
}
