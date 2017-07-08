import Foundation

class MOptionWhistlesVsZombiesWhistlePink:MOptionWhistlesVsZombiesWhistleProtocol
{
    private let kSpeed:TimeInterval = 9
    private let kPower:Int = 9
    
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
