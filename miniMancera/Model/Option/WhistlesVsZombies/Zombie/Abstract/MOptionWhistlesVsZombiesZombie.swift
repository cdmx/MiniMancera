import Foundation

class MOptionWhistlesVsZombiesZombie:MGameUpdate<MOptionWhistlesVsZombies>
{
    let types:[MOptionWhistlesVsZombiesZombieItemProtocol]
    private(set) weak var ground:MOptionWhistlesVsZombiesGround!
    private(set) var items:[MOptionWhistlesVsZombiesZombieItem]
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
        items.append(item)
        
        guard
        
            let scene:VOptionWhistlesVsZombiesScene = scene as? VOptionWhistlesVsZombiesScene
        
        else
        {
            return
        }
        
        scene.addZombie(model:item)
    }
    
    func zombieDefeated(zombie:MOptionWhistlesVsZombiesZombieItem)
    {
        var items:[MOptionWhistlesVsZombiesZombieItem] = []
        
        for item:MOptionWhistlesVsZombiesZombieItem in self.items
        {
            if item !== zombie
            {
                items.append(item)
            }
        }
        
        self.items = items
    }
    
    func restart()
    {
        items = []
    }
}
