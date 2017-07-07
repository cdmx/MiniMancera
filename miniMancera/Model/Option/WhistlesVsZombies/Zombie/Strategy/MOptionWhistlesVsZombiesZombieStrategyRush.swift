import Foundation

class MOptionWhistlesVsZombiesZombieStrategyRush:MOptionWhistlesVsZombiesZombieStrategy
{
    private let kWaitTime:TimeInterval = 0.05
    
    override var waitTime:TimeInterval
    {
        get
        {
            return kWaitTime
        }
    }
}
