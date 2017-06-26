import UIKit

class MOptionReformaCrossingFoeItemTamales:MOptionReformaCrossingFoeItem
{
    private let kRandomMaxSpeed:UInt32 = 30
    private let kMinSpeed:CGFloat = -40
    
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
