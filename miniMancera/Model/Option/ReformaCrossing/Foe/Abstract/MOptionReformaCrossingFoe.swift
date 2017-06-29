import SpriteKit

class MOptionReformaCrossingFoe:MGameUpdateProtocol
{
    private var elapsedTime:TimeInterval?
    private let kSpawnRate:TimeInterval = 0.1
    private let kSpawnProbability:UInt32 = 6
    
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
        let model:MOptionReformaCrossing = scene.controller.model
        
        guard
        
            let lane:MOptionReformaCrossingLane = controller.model.laneGroup.randomLane(),
            let foe:MOptionReformaCrossingFoeItem = MOptionReformaCrossingFoe.randomFoe(
                model:model,
                lane:lane)
        
        else
        {
            return
        }
        
        let view:VOptionReformaCrossingFoe = VOptionReformaCrossingFoe(
            controller:controller,
            model:foe)
        foe.view = view
        
        scene.addChild(view)
    }
    
    //MARK: game update protocol
    
    func update(elapsedTime:TimeInterval, scene:SKScene)
    {
        if let lastElapsedTime:TimeInterval = self.elapsedTime
        {
            let deltaTime:TimeInterval = abs(elapsedTime - lastElapsedTime)
            
            if deltaTime > kSpawnRate
            {
                self.elapsedTime = elapsedTime
                
                guard
                    
                    let scene:VOptionReformaCrossingScene = scene as? VOptionReformaCrossingScene
                    
                else
                {
                    return
                }
                
                self.elapsedTime = elapsedTime
                spawnFoe(scene:scene)
            }
        }
        else
        {
            self.elapsedTime = elapsedTime
        }
    }
}
