import SpriteKit

class MOptionWhistlesVsZombies:MGame
{
    weak var viewMenu:ViewGameNodeMenu<MOptionWhistlesVsZombies>?
    let ground:MOptionWhistlesVsZombiesGround
    let whistle:MOptionWhistlesVsZombiesWhistle
    let zombie:MOptionWhistlesVsZombiesZombie
    let sonicBoom:MOptionWhistlesVsZombiesSonicBoom
    let textures:MOptionWhistlesVsZombiesTextures
    let actions:MOptionWhistlesVsZombiesActions
    let contact:MOptionWhistlesVsZombiesContact
    private(set) var coins:Int
    private var strategy:MGameStrategyMain<MOptionWhistlesVsZombies>?
    private let kInitialCoins:Int = 30
    
    required init()
    {
        let area:MOptionWhistlesVsZombiesArea = MOptionWhistlesVsZombies.loadArea()
        
        textures = MOptionWhistlesVsZombiesTextures()
        actions = MOptionWhistlesVsZombiesActions(textures:textures)
        ground = MOptionWhistlesVsZombiesGround(area:area)
        whistle = MOptionWhistlesVsZombiesWhistle(
            area:area,
            textures:textures)
        sonicBoom = MOptionWhistlesVsZombiesSonicBoom()
        contact = MOptionWhistlesVsZombiesContact()
        zombie = MOptionWhistlesVsZombiesZombie(
            ground:ground,
            textures:textures,
            actions:actions)
        coins = kInitialCoins
        
        super.init()
        
        startLevel()
    }
    
    override var startSceneType:SKScene.Type?
    {
        get
        {
            return VOptionWhistlesVsZombiesScene.self
        }
    }
    
    override func startLevel()
    {
        super.startLevel()
        
        strategy = MOptionWhistlesVsZombiesStrategyBegin(model:self)
    }
    
    override func activateGame()
    {
        super.activateGame()
        strategyGame()
    }
    
    override func gameStrategy<T>(modelType:T) -> MGameStrategyMain<T>? where T:MGame
    {
        return strategy as? MGameStrategyMain<T>
    }
    
    //MARK: public
    
    func strategyGame()
    {
        strategy = MOptionWhistlesVsZombiesStrategyGame(model:self)
    }
    
    func whistleSelected(
        base:MOptionWhistlesVsZombiesWhistleBase,
        item:MOptionWhistlesVsZombiesBoardItemProtocol)
    {
        coins -= item.price
        base.charge(whistleType:item.whistleType)
    }
}
