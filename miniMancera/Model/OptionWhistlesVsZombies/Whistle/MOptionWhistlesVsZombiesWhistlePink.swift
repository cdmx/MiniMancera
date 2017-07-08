import UIKit

class MOptionWhistlesVsZombiesWhistlePink:MOptionWhistlesVsZombiesWhistleProtocol
{
    private let kSpeed:TimeInterval = 9
    private let kPower:CGFloat = 9
    
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
