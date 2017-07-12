import Foundation

class MOptionWhistlesVsZombiesSonicBoomItemStrategyMoving:MGameStrategy<MOptionWhistlesVsZombiesSonicBoomItem,
    MOptionWhistlesVsZombies>
{
    private var startingTime:TimeInterval?
    private let kDuration:TimeInterval = 0.6
    
    override func update(
        elapsedTime:TimeInterval,
        scene:ViewGameScene<MOptionWhistlesVsZombies>)
    {
        if let startingTime:TimeInterval = self.startingTime
        {
            let deltaTime:TimeInterval = elapsedTime - startingTime
            
            if deltaTime > kDuration
            {
                guard
                
                    let viewRelease:VOptionWhistlesVsZombiesSonicRelease = model.viewRelease
                
                else
                {
                    return
                }
                
                viewRelease.endRelease()
            }
        }
        else
        {
            startingTime = elapsedTime
            model.viewBoom?.shoot()
        }
    }
}
