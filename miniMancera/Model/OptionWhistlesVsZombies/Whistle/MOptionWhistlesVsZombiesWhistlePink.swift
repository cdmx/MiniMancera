import UIKit

class MOptionWhistlesVsZombiesWhistlePink:MOptionWhistlesVsZombiesWhistleProtocol
{
    private let kSpeed:CGFloat = 10
    private let kPower:CGFloat = 10
    
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
