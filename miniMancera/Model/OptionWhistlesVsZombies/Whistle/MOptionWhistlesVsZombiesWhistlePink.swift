import UIKit

class MOptionWhistlesVsZombiesWhistlePink:MOptionWhistlesVsZombiesWhistleProtocol
{
    private let kSpeed:TimeInterval = 10
    private let kPower:CGFloat = 10
    
    var speed:TimeInterval
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
