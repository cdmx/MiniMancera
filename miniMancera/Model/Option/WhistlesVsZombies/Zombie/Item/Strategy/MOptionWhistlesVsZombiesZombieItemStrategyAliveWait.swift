import Foundation

class MOptionWhistlesVsZombiesZombieItemStrategyAliveWait:MOptionWhistlesVsZombiesZombieItemStrategyAlive
{
    private var startingTime:TimeInterval?
    private let walkRate:UInt32
    private let kWaitTime:TimeInterval = 0.1
    private let kWalkMultiplier:Int = 10
    private let kWalkMax:Int = 100
    private let kWalkMin:Int = 10
    
    override init(model:MOptionWhistlesVsZombiesZombieItem)
    {
        let zombieWalk:Int = model.type.intelligence * kWalkMultiplier
        var zombieWalkSubtract:Int = kWalkMax - zombieWalk
        
        if zombieWalkSubtract < 0
        {
            zombieWalkSubtract = 0
        }
        
        let totalZombieWalk:Int = zombieWalkSubtract + kWalkMin
        walkRate = UInt32(totalZombieWalk)
        
        super.init(model:model)
    }
    
    override func update(
        elapsedTime:TimeInterval,
        scene:ViewGameScene<MOptionWhistlesVsZombies>)
    {
        super.update(
            elapsedTime:elapsedTime,
            scene:scene)
        
        let alive:Bool = model.alive()
        
        if alive
        {
            if let startingTime:TimeInterval = self.startingTime
            {
                let deltaTime:TimeInterval = elapsedTime - startingTime
                
                if deltaTime > kWaitTime
                {
                    self.startingTime = elapsedTime
                    
                    tryWalk()
                }
            }
            else
            {
                startingTime = elapsedTime
                model.view?.wait()
            }
        }
    }
    
    //MARK: private
    
    private func tryWalk()
    {
        let random:UInt32 = arc4random_uniform(walkRate)
        
        if random == 0
        {
            model.walk()
        }
    }
}
