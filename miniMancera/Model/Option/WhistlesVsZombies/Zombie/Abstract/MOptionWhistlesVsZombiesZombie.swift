import Foundation

class MOptionWhistlesVsZombiesZombie:MGameUpdate<MOptionWhistlesVsZombies>
{
    private weak var ground:MOptionWhistlesVsZombiesGround!
    private let types:[MOptionWhistlesVsZombiesZombieItemProtocol]
    private var items:[MOptionWhistlesVsZombiesZombieItem]
    private var strategy:MGameStrategy<MOptionWhistlesVsZombiesZombie, MOptionWhistlesVsZombies>?
    private let countTypes:UInt32
    
    init(
        ground:MOptionWhistlesVsZombiesGround,
        textures:MOptionWhistlesVsZombiesTextures,
        actions:MOptionWhistlesVsZombiesActions)
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
    
    private func factoryZombie() -> MOptionWhistlesVsZombiesZombieItem
    {
        let lane:MOptionWhistlesVsZombiesGroundLane = ground.randomLane()
        let 
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
    
    func spawnZombie(scene:ViewGameScene<MOptionWhistlesVsZombies>)
    {
        let item:MOptionWhistlesVsZombiesZombieItem = factoryZombie()
    }
}
