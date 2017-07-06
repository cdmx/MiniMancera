import Foundation

class MOptionWhistlesVsZombiesSonicBoomItem:MGameUpdate<MOptionWhistlesVsZombies>
{
    weak var viewRelease:VOptionWhistlesVsZombiesSonicRelease?
    private(set) weak var base:MOptionWhistlesVsZombiesWhistleBase!
    private(set) weak var whistleType:MOptionWhistlesVsZombiesWhistleTypeProtocol!
    private var strategy:MGameStrategy<MOptionWhistlesVsZombiesSonicBoomItem, MOptionWhistlesVsZombies>?
    
    init(
        base:MOptionWhistlesVsZombiesWhistleBase,
        whistleType:MOptionWhistlesVsZombiesWhistleTypeProtocol)
    {
        self.base = base
        self.whistleType = whistleType
        super.init()
        
        strategy = MOptionWhistlesVsZombiesSonicBoomItemStrategyRelease(
            model:self)
    }
    
    override func update(
        elapsedTime:TimeInterval,
        scene:ViewGameScene<MOptionWhistlesVsZombies>)
    {
        strategy?.update(
            elapsedTime:elapsedTime,
            scene:scene)
    }
    
    //MARK: public
    
    func moving()
    {
        viewRelease?.endRelease()
        strategy = MOptionWhistlesVsZombiesSonicBoomItemStrategyMoving(
            model:self)
    }
    
    func collision()
    {
        strategy = MOptionWhistlesVsZombiesSonicBoomItemStrategyCollision(
            model:self)
    }
}
