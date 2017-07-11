import SpriteKit

class MOptionWhistlesVsZombies:MGame
{
    weak var viewMenu:ViewGameNodeMenu<MOptionWhistlesVsZombies>?
    weak var viewTitle:VOptionWhistlesVsZombiesTitle?
    let ground:MOptionWhistlesVsZombiesGround
    let player:MOptionWhistlesVsZombiesPlayer
    let whistle:MOptionWhistlesVsZombiesWhistle
    let zombie:MOptionWhistlesVsZombiesZombie
    let sonicBoom:MOptionWhistlesVsZombiesSonicBoom
    let points:MOptionWhistlesVsZombiesPoints
    let textures:MOptionWhistlesVsZombiesTextures
    let actions:MOptionWhistlesVsZombiesActions
    let contact:MOptionWhistlesVsZombiesContact
    let hud:MOptionWhistlesVsZombiesHud
    let horde:MOptionWhistlesVsZombiesHorde
    private(set) var coins:Int
    private var strategy:MGameStrategyMain<MOptionWhistlesVsZombies>?
    private let kSoundBackground:String = "soundWhistlesVsZombies.caf"
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
        player = MOptionWhistlesVsZombiesPlayer()
        sonicBoom = MOptionWhistlesVsZombiesSonicBoom()
        contact = MOptionWhistlesVsZombiesContact()
        zombie = MOptionWhistlesVsZombiesZombie(
            ground:ground,
            textures:textures,
            actions:actions)
        points = MOptionWhistlesVsZombiesPoints()
        hud = MOptionWhistlesVsZombiesHud()
        horde = MOptionWhistlesVsZombiesHorde()
        coins = kInitialCoins
        
        super.init()
        
        hud.model = self
        startLevel()
    }
    
    override var startSceneType:SKScene.Type?
    {
        get
        {
            return VOptionWhistlesVsZombiesScene.self
        }
    }
    
    override var soundBackground:String?
    {
        get
        {
            return kSoundBackground
        }
    }
    
    override func startLevel()
    {
        super.startLevel()
        
        score = 0
        coins = kInitialCoins
        player.stand()
        whistle.restart()
        zombie.restart()
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
    
    //MARK: private
    
    private func strategyGame()
    {
        strategy = MOptionWhistlesVsZombiesStrategyGame(model:self)
    }
    
    //MARK: public
    
    func strategyWait()
    {
        strategy = MOptionWhistlesVsZombiesStrategyWait(model:self)
    }
    
    func whistleSelected(
        base:MOptionWhistlesVsZombiesWhistleBase,
        item:MOptionWhistlesVsZombiesBoardItemProtocol)
    {
        coins -= item.price
        base.charge(whistleType:item.whistleType)
    }
    
    func zombieDefeated(zombie:MOptionWhistlesVsZombiesZombieItem)
    {
        score += 1
        coins += zombie.type.coins
        
        points.addPoints(zombie:zombie)
    }
    
    func zombiesGotHome()
    {
        player.defeated()
        deActivateGame()
        strategy = MOptionWhistlesVsZombiesStrategyDefeated(model:self)
    }
}
