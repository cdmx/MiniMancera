import SpriteKit

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
            animateCollision(scene:scene)
        }
    }
    
    //MARK: private
    
    private func animateCollision(scene:ViewGameScene<MOptionWhistlesVsZombies>)
    {
        let soundHeadWall:SKAction = scene.controller.model.sounds.soundHeadWall
        scene.controller.playSound(actionSound:soundHeadWall)
        
        model.viewBoom?.collisionAnimate()
    }
    
    private func collisionFinish(scene:ViewGameScene<MOptionWhistlesVsZombies>)
    {
        model.collisionFinish(scene:scene)
    }
}
