import UIKit

class MOptionReformaCrossingFoeItemRuta2:MOptionReformaCrossingFoeItem
{
    private let kRandomMaxSpeed:UInt32 = 100
    
    override var randomMaxSpeed:UInt32
    {
        get
        {
            return kRandomMaxSpeed
        }
    }
}
