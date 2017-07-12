import Foundation

class MOptionWhistlesVsZombiesWhistlePink:MOptionWhistlesVsZombiesWhistleProtocol
{
    private let kSpeed:TimeInterval = 8
    private let kPower:Int = 8
    
    var speed:TimeInterval
    {
        get
        {
            return kSpeed
        }
    }
    
    var power:Int
    {
        get
        {
            return kPower
        }
    }
}
