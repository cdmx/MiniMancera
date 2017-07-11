import SpriteKit

class MOptionWhistlesVsZombiesWhistleBaseStrategyExploded:MGameStrategy<
    MOptionWhistlesVsZombiesWhistleBase,
    MOptionWhistlesVsZombies>
{
    private var startingTime:TimeInterval?
    private let kWait:TimeInterval = 1
    
    override func update(
        elapsedTime:TimeInterval,
        scene:ViewGameScene<MOptionWhistlesVsZombies>)
    {
        if let startingTime:TimeInterval = self.startingTime
        {
            let deltaTime:TimeInterval = elapsedTime - startingTime
            
            if deltaTime > kWait
            {
                model.explodeFinish()
            }
        }
        else
        {
            startingTime = elapsedTime
            showExploded(scene:scene)
        }
    }
    
    //MARK: private
    
    private func showExploded(scene:ViewGameScene<MOptionWhistlesVsZombies>)
    {
        let soundExplosion:SKAction = scene.controller.model.sounds.soundExplosion
        scene.controller.playSound(actionSound:soundExplosion)
        
        model.viewWhistle?.explode()
    }
}
