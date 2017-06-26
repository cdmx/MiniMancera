import SpriteKit

class MOptionReformaCrossingFoe
{
    private var elapsedTime:TimeInterval
    private let kSpawnRate:TimeInterval = 0.1
    private let kSpawnProbability:UInt32 = 6

    init()
    {
        elapsedTime = 0
    }
    
    //MARK: private
    
    private func shouldSpawn() -> Bool
    {
        let random:UInt32 = arc4random_uniform(kSpawnProbability)
        
        if random == 0
        {
            return true
        }
        
        return false
    }
    
    private func spawnFoe(scene:VOptionReformaCrossingScene)
    {
        let should:Bool = shouldSpawn()
        
        if should
        {
            confirmedSpawnFoe(scene:scene)
        }
    }
    
    private func confirmedSpawnFoe(scene:VOptionReformaCrossingScene)
    {
        let controller:ControllerGame<MOptionReformaCrossing> = scene.controller
        
        guard
        
            let lane:MOptionReformaCrossingLane = controller.model.laneGroup.randomLane()
        
        else
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
    
    //MARK: public
    
    func update(elapsedTime:TimeInterval, scene:SKScene)
    {
        guard
            
            let scene:VOptionReformaCrossingScene = scene as? VOptionReformaCrossingScene
        
        else
        {
            return
        }
        
        let deltaTime:TimeInterval = elapsedTime - self.elapsedTime
        
        if deltaTime > kSpawnRate
        {
            spawnFoe(scene:scene)
        }
    }
}
