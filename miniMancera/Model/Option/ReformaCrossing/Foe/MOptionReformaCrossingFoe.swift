import Foundation

class MOptionReformaCrossingFoe
{
    weak var model:MOptionReformaCrossing!
    private var elapsedTime:TimeInterval
    private let kSpawnRate:TimeInterval = 0.1
    private let kSpawnProbability:UInt32 = 6

    init()
    {
        elapsedTime = 0
    }
    
    //MARK: private
    
    private func spawnFoe()
    {
        let should:Bool = shouldSpawn()
        
        if should
        {
            let lane:MOptionReformaCrossingLane = model.laneGroup.randomLane()
            
            let hasFoeWaiting:Bool = lane.hasFoeWaiting(
                sceneSize:controller.model.size)
            
            if hasFoeWaiting
            {
                return
            }
            
            guard
                
                let foe:VOptionReformaCrossingFoe = VOptionReformaCrossingFoe.randomFoe(
                    lane:lane,
                    controller:controller)
                
            else
            {
                return
            }
            
            addChild(foe)
        }
    }
    
    private func shouldSpawn() -> Bool
    {
        let random:UInt32 = arc4random_uniform(kSpawnProbability)
        
        if random == 0
        {
            return true
        }
        
        return false
    }
    
    //MARK: public
    
    func update(elapsedTime:TimeInterval)
    {
        let deltaTime:TimeInterval = elapsedTime - self.elapsedTime
        
        if deltaTime > kSpawnRate
        {
            spawnFoe()
        }
        
        self.elapsedTime = elapsedTime
    }
}
