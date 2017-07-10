import Foundation

class MOptionWhistlesVsZombiesWhistleBlue:MOptionWhistlesVsZombiesWhistleProtocol
{
    private let kSpeed:TimeInterval = 13
    private let kPower:Int = 4
    
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
