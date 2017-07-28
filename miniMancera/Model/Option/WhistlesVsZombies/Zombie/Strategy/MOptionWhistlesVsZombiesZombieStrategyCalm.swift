import Foundation

class MOptionWhistlesVsZombiesZombieStrategyCalm:MOptionWhistlesVsZombiesZombieStrategy
{
    private var lastElapsedTime:TimeInterval?
    private let kWaitTime:TimeInterval = 0.05
    private let kSpawnRate:UInt32 = 60
    private let kDeltaTime:TimeInterval = 5
    private let kHordeRatio:UInt32 = 50
    
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
    
    override func update(
        elapsedTime:TimeInterval,
        scene:ViewGameScene<MOptionWhistlesVsZombies>)
    {
        super.update(
            elapsedTime:elapsedTime,
            scene:scene)
        
        if let lastElapsedTime:TimeInterval = self.lastElapsedTime
        {
            let deltaTime:TimeInterval = elapsedTime - lastElapsedTime
            
            if deltaTime > kDeltaTime
            {
                self.lastElapsedTime = elapsedTime
                
                tryHorde(scene:scene)
            }
        }
        else
        {
            lastElapsedTime = elapsedTime
            scene.controller.model.horde.hide()
        }
    }
    
    //MARK: private
    
    private func tryHorde(scene:ViewGameScene<MOptionWhistlesVsZombies>)
    {
        let random:UInt32 = arc4random_uniform(kHordeRatio)
        
        if random == 0
        {
            model.horde(scene:scene)
        }
    }
}
