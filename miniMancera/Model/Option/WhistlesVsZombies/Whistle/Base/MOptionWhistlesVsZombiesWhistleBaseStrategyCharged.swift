import Foundation

class MOptionWhistlesVsZombiesWhistleBaseStrategyCharged:MGameStrategy<
    MOptionWhistlesVsZombiesWhistleBase,
    MOptionWhistlesVsZombies>
{
    private var lastElapsedTime:TimeInterval?
    
    override func update(
        elapsedTime:TimeInterval,
        scene:ViewGameScene<MOptionWhistlesVsZombies>)
    {
        if let lastElapsedTime:TimeInterval = self.lastElapsedTime
        {
            
        }
        else
        {
            lastElapsedTime = elapsedTime
        }
    }
}
