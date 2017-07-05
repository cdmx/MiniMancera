import UIKit

class MOptionWhistlesVsZombiesWhistleBlue:MOptionWhistlesVsZombiesWhistleProtocol
{
    private let kSpeed:TimeInterval = 20
    private let kPower:CGFloat = 4
    
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
