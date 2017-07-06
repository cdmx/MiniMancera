import Foundation

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
        }
    }
    
    //MARK: private
    
    private func releaseSonicBoom(scene:ViewGameScene<MOptionWhistlesVsZombies>)
    {
        scene.controller.model.sonicBoom.release(
            base:model,
            whistleType:whistleType)
    }
}
