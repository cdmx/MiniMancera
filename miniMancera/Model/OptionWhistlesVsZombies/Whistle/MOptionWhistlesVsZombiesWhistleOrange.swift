import UIKit

class MOptionWhistlesVsZombiesWhistleOrange:MOptionWhistlesVsZombiesWhistleProtocol
{
    private let kSpeed:TimeInterval = 5
    private let kPower:CGFloat = 13
    
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
