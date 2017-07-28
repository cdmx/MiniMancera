import Foundation

class MOptionWhistlesVsZombiesZombieStrategyHorde:MOptionWhistlesVsZombiesZombieStrategy
{
    private var titleHidden:Bool
    private var startingTime:TimeInterval?
    private let kWaitTime:TimeInterval = 0.05
    private let kSpawnRate:UInt32 = 5
    private let kDuration:TimeInterval = 10
    private let kTitleDuration:TimeInterval = 4
    
    override init(model:MOptionWhistlesVsZombiesZombie)
    {
        titleHidden = false
        super.init(model:model)
    }
    
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
        
        if let startingTime:TimeInterval = self.startingTime
        {
            let deltaTime:TimeInterval = elapsedTime - startingTime
            
            if deltaTime > kTitleDuration
            {
                if !titleHidden
                {
                    titleHidden = true
                    scene.controller.model.horde.viewTitle?.alpha = 0
                }
            }
            
            if deltaTime > kDuration
            {
                model.calm()
            }
        }
        else
        {
            startingTime = elapsedTime
            scene.controller.model.horde.show()
        }
    }
}
