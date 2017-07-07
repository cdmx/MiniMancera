import Foundation

class MOptionWhistlesVsZombiesZombie:MGameUpdate<MOptionWhistlesVsZombies>
{
    let types:[MOptionWhistlesVsZombiesZombieItemProtocol]
    private(set) weak var ground:MOptionWhistlesVsZombiesGround!
    private var items:[MOptionWhistlesVsZombiesZombieItem]
    private var strategy:MGameStrategy<MOptionWhistlesVsZombiesZombie, MOptionWhistlesVsZombies>?
    let countTypes:UInt32
    
    init(
        ground:MOptionWhistlesVsZombiesGround,
        textures:MOptionWhistlesVsZombiesTextures,
        actions:MOptionWhistlesVsZombiesActions)
    {
        self.ground = ground
        types = MOptionWhistlesVsZombiesZombie.factoryTypes(
            textures:textures,
            actions:actions)
        items = []
        countTypes = UInt32(types.count)
        
        super.init()
        
        calm()
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
