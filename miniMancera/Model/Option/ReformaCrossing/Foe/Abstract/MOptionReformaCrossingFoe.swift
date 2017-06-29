import SpriteKit

class MOptionReformaCrossingFoe:MGameUpdate<MOptionReformaCrossing>
{
    private var elapsedTime:TimeInterval?
    private let kSpawnRate:TimeInterval = 0.1
    private let kSpawnProbability:UInt32 = 6
    
    override func update(
        elapsedTime:TimeInterval,
        scene:ViewGameScene<MOptionReformaCrossing>)
    {
        if let lastElapsedTime:TimeInterval = self.elapsedTime
        {
            let deltaTime:TimeInterval = abs(elapsedTime - lastElapsedTime)
            
            if deltaTime > kSpawnRate
            {
                self.elapsedTime = elapsedTime
                spawnFoe(scene:scene)
            }
        }
        else
        {
            self.elapsedTime = elapsedTime
        }
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
    
    private func spawnFoe(scene:ViewGameScene<MOptionReformaCrossing>)
    {
        let should:Bool = shouldSpawn()
        
        if should
        {
            confirmedSpawnFoe(scene:scene)
        }
    }
    
    private func confirmedSpawnFoe(scene:ViewGameScene<MOptionReformaCrossing>)
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
}
