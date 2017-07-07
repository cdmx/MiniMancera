import Foundation

class MOptionWhistlesVsZombiesZombie:MGameUpdate<MOptionWhistlesVsZombies>
{
    private weak var ground:MOptionWhistlesVsZombiesGround!
    private var items:[MOptionWhistlesVsZombiesZombieItem]
    private var strategy:MGameStrategy<MOptionWhistlesVsZombiesZombie, MOptionWhistlesVsZombies>?
    
    init(ground:MOptionWhistlesVsZombiesGround)
    {
        items = []
        super.init()
        self.ground = ground
    }
    
    override func update(
        elapsedTime:TimeInterval,
        scene:ViewGameScene<MOptionWhistlesVsZombies>)
    {
        
    }
    
    //MARK: public
    
    func calm()
    {
        strategy = MOptionWhistlesVsZombiesZombieStrategyCalm(
            model:self)
    }
    
    func rush()
    {
        strategy = MOptionWhistlesVsZombiesZombieStrategyRush(
            model:self)
    }
}
