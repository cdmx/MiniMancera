import UIKit

class MOptionWhistlesVsZombiesWhistleOrange:MOptionWhistlesVsZombiesWhistleProtocol
{
    private let kSpeed:CGFloat = 5
    private let kPower:CGFloat = 13
    
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
