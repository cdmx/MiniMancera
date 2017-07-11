import Foundation

class MOptionWhistlesVsZombiesZombieStrategyCalm:MOptionWhistlesVsZombiesZombieStrategy
{
    private let kWaitTime:TimeInterval = 0.05
    private let kSpawnRate:UInt32 = 55
    
    override var waitTime:TimeInterval
    {
        get
        {
            return kWaitTime
        }
    }
    
    override var spawnRate:UInt32
    {
        get
        {
            return kSpawnRate
        }
    }
}
