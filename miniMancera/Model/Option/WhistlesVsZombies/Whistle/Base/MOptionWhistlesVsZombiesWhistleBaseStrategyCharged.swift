import Foundation

class MOptionWhistlesVsZombiesWhistleBaseStrategyCharged:MGameStrategy<
    MOptionWhistlesVsZombiesWhistleBase,
    MOptionWhistlesVsZombies>
{
    private weak var whistleType:MOptionWhistlesVsZombiesWhistleType!
    private var lastElapsedTime:TimeInterval?
    private let deltaTime:TimeInterval
    private let kDeltaDividend:TimeInterval = 10
    
    init(
        model:MOptionWhistlesVsZombiesWhistleBase,
        whistleType:MOptionWhistlesVsZombiesWhistleType)
    {
        self.whistleType = whistleType
        deltaTime = kDeltaDividend / whistleType.speed
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
        
    }
}
