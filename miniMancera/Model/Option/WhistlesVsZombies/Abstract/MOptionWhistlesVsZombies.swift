import SpriteKit

class MOptionWhistlesVsZombies:MGame
{
    weak var viewMenu:ViewGameNodeMenu<MOptionWhistlesVsZombies>?
    let whistle:MOptionWhistlesVsZombiesWhistle
    let sonicBoom:MOptionWhistlesVsZombiesSonicBoom
    let textures:MOptionWhistlesVsZombiesTextures
    let actions:MOptionWhistlesVsZombiesActions
    private var strategy:MGameStrategyMain<MOptionWhistlesVsZombies>?
    
    required init()
    {
        whistle = MOptionWhistlesVsZombiesWhistle()
        sonicBoom = MOptionWhistlesVsZombiesSonicBoom()
        textures = MOptionWhistlesVsZombiesTextures()
        actions = MOptionWhistlesVsZombiesActions()
        
        super.init()
        
        actions.factoryAnimations(textures:textures)
        whistle.factoryWithTextures(textures:textures)
        
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
}
