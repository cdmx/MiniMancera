import SpriteKit

class MOptionWhistlesVsZombiesWhistleBaseStrategyCharged:MGameStrategy<
    MOptionWhistlesVsZombiesWhistleBase,
    MOptionWhistlesVsZombies>
{
    private weak var whistleType:MOptionWhistlesVsZombiesWhistleTypeProtocol!
    private var lastElapsedTime:TimeInterval?
    private let deltaTime:TimeInterval
    private let kDeltaDividend:TimeInterval = 45
    
    init(
        model:MOptionWhistlesVsZombiesWhistleBase,
        whistleType:MOptionWhistlesVsZombiesWhistleTypeProtocol)
    {
        self.whistleType = whistleType
        deltaTime = kDeltaDividend / whistleType.whistle.speed
        super.init(model:model)
    }
    
    override func update(
        elapsedTime:TimeInterval,
        scene:ViewGameScene<MOptionWhistlesVsZombies>)
    {
        if let lastElapsedTime:TimeInterval = self.lastElapsedTime
        {
            let deltaTime:TimeInterval = elapsedTime - lastElapsedTime
            
            if deltaTime > self.deltaTime
            {
                self.lastElapsedTime = elapsedTime
                releaseSonicBoom(scene:scene)
            }
        }
        else
        {
            lastElapsedTime = elapsedTime
            createView(scene:scene)
        }
    }
    
    //MARK: private
    
    private func createView(scene:ViewGameScene<MOptionWhistlesVsZombies>)
    {
        guard
        
            let scene:VOptionWhistlesVsZombiesScene = scene as? VOptionWhistlesVsZombiesScene
        
        else
        {
            return
        }
        
        let model:MOptionWhistlesVsZombies = scene.controller.model
        let soundGunCock:SKAction = model.sounds.soundGunCock
        scene.controller.playSound(actionSound:soundGunCock)
        scene.addWhistle(base:self.model)
    }
    
    private func releaseSonicBoom(scene:ViewGameScene<MOptionWhistlesVsZombies>)
    {
        let model:MOptionWhistlesVsZombies = scene.controller.model
        let soundWhistle:SKAction = model.sounds.soundWhistle
        scene.controller.playSound(actionSound:soundWhistle)
        
        model.sonicBoom.release(
            base:self.model,
            whistleType:whistleType)
    }
}
