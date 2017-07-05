import UIKit

class MOptionWhistlesVsZombiesWhistleBlue:MOptionWhistlesVsZombiesWhistleProtocol
{
    private let kSpeed:CGFloat = 20
    private let kPower:CGFloat = 4
    
    var speed:CGFloat
    {
        get
        {
            return kSpeed
        }
    }
    
    var power:CGFloat
    {
        get
        {
            return kPower
        }
    }
}
