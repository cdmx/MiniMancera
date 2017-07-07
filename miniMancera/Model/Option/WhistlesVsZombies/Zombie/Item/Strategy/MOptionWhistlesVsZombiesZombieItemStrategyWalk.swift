import UIKit

class MOptionWhistlesVsZombiesZombieItemStrategyWalk:MGameStrategy<
    MOptionWhistlesVsZombiesZombieItem,
    MOptionWhistlesVsZombies>
{
    private var lastElapsedTime:TimeInterval?
    private let speed:CGFloat
    private let kSpeedDivider:CGFloat = -10
    private let kWaitRate:UInt32 = 30
    
    override init(model:MOptionWhistlesVsZombiesZombieItem)
    {
        let zombieSpeed:CGFloat = CGFloat(model.type.speed)
        speed = zombieSpeed / kSpeedDivider
        
        super.init(model:model)
    }
    
    override func update(
        elapsedTime:TimeInterval,
        scene:ViewGameScene<MOptionWhistlesVsZombies>)
    {
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
        let random:UInt32 = arc4random_uniform(kWaitRate)
        
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
        model.movePositionX(deltaX:moveDelta)
    }
}
