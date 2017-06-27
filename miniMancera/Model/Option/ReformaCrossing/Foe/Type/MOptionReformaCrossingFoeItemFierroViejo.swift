import UIKit

class MOptionReformaCrossingFoeItemFierroViejo:MOptionReformaCrossingFoeItem
{
    private let kRandomMaxSpeed:UInt32 = 20
    
    override var randomMaxSpeed:UInt32
    {
        get
        {
            return kRandomMaxSpeed
        }
    }
}
