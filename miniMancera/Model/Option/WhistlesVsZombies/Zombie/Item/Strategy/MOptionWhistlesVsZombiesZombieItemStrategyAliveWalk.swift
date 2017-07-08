import UIKit

class MOptionWhistlesVsZombiesZombieItemStrategyAliveWalk:MOptionWhistlesVsZombiesZombieItemStrategyAlive
{
    private var lastElapsedTime:TimeInterval?
    private let speed:CGFloat
    private let waitRate:UInt32
    private let kSpeedMultiplier:CGFloat = -4
    private let kWaitMin:Int = 150
    private let kWaitMultiplier:Int = 25
    
    override init(model:MOptionWhistlesVsZombiesZombieItem)
    {
        let zombieSpeed:CGFloat = CGFloat(model.type.speed)
        let zombieWait:Int = model.type.intelligence * kWaitMultiplier
        let totalZombieWait:Int = zombieWait + kWaitMin
        speed = zombieSpeed * kSpeedMultiplier
        waitRate = UInt32(totalZombieWait)
        
        super.init(model:model)
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
            tryWait(deltaTime:deltaTime)
        }
        else
        {
            model.view?.walk()
        }
        
        lastElapsedTime = elapsedTime
    }
    
    //MARK: private
    
    private func tryWait(deltaTime:TimeInterval)
    {
        let random:UInt32 = arc4random_uniform(waitRate)
        
        if random == 0
        {
            model.wait()
        }
        else
        {
            move(deltaTime:deltaTime)
        }
    }
    
    private func move(deltaTime:TimeInterval)
    {
        let deltaTime:CGFloat = CGFloat(deltaTime)
        let moveDelta:CGFloat = deltaTime * speed
        model.view?.move(force:moveDelta)
    }
}
