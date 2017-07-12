import Foundation

class MOptionWhistlesVsZombiesWhistleOrange:MOptionWhistlesVsZombiesWhistleProtocol
{
    private let kSpeed:TimeInterval = 5
    private let kPower:Int = 13
    
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
