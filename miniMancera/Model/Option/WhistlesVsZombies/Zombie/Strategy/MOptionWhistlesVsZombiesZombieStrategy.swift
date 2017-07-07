import Foundation

class MOptionWhistlesVsZombiesZombieStrategy:MGameStrategy<
    MOptionWhistlesVsZombiesZombie,
    MOptionWhistlesVsZombies>
{
    private(set) var waitTime:TimeInterval
    private(set) var spawnRate:UInt32
    private var lastElapsedTime:TimeInterval?
    
    override init(model:MOptionWhistlesVsZombiesZombie)
    {
        waitTime = 0
        spawnRate = 0
        super.init(model:model)
    }
    
    override func update(
        elapsedTime:TimeInterval,
        scene:ViewGameScene<MOptionWhistlesVsZombies>)
    {
        if let lastElapsedTime:TimeInterval = self.lastElapsedTime
        {
            let deltaTime:TimeInterval = elapsedTime - lastElapsedTime
            
            if deltaTime > waitTime
            {
                self.lastElapsedTime = elapsedTime
                trySpawnZombie(scene:scene)
            }
        }
        else
        {
            lastElapsedTime = elapsedTime
        }
    }
    
    //MARK: private
    
    private func trySpawnZombie(scene:ViewGameScene<MOptionWhistlesVsZombies>)
    {
        let random:UInt32 = arc4random_uniform(spawnRate)
        
        if random == 0
        {
            model.spawnZombie(scene:scene)
        }
    }
}
