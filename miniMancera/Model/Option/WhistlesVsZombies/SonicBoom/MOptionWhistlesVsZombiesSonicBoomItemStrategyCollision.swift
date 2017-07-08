import Foundation

class MOptionWhistlesVsZombiesSonicBoomItemStrategyCollision:MGameStrategy<MOptionWhistlesVsZombiesSonicBoomItem,
    MOptionWhistlesVsZombies>
{
    private var startingTime:TimeInterval?
    private let kDuration:TimeInterval = 1
    
    override func update(
        elapsedTime:TimeInterval,
        scene:ViewGameScene<MOptionWhistlesVsZombies>)
    {
        if let startingTime:TimeInterval = self.startingTime
        {
            let deltaTime:TimeInterval = elapsedTime - startingTime
            
            if deltaTime > kDuration
            {
                collisionFinish(scene:scene)
            }
        }
        else
        {
            startingTime = elapsedTime
            animateCollision()
        }
    }
    
    //MARK: private
    
    private func animateCollision()
    {
        model.viewBoom?.collisionAnimate()
    }
    
    private func collisionFinish(scene:ViewGameScene<MOptionWhistlesVsZombies>)
    {
        model.collisionFinish(scene:scene)
    }
}
