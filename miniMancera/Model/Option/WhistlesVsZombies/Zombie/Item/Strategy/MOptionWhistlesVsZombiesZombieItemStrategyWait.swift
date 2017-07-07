import Foundation

class MOptionWhistlesVsZombiesZombieItemStrategyWait:MGameStrategy<
    MOptionWhistlesVsZombiesZombieItem,
    MOptionWhistlesVsZombies>
{
    private var startingTime:TimeInterval?
    private let kWaitTime:TimeInterval = 0.2
    private let kWalkRate:UInt32 = 10
    
    override func update(
        elapsedTime:TimeInterval,
        scene:ViewGameScene<MOptionWhistlesVsZombies>)
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
    
    //MARK: private
    
    private func tryWalk()
    {
        let random:UInt32 = arc4random_uniform(kWalkRate)
        
        if random == 0
        {
            model.walk()
        }
    }
}
