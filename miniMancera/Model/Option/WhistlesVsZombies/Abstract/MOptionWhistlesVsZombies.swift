import SpriteKit

class MOptionWhistlesVsZombies:MGame
{
    let whistle:MOptionWhistlesVsZombiesWhistle
    let sonicBoom:MOptionWhistlesVsZombiesSonicBoom
    let board:MOptionWhistlesVsZombiesBoard
    let textures:MOptionWhistlesVsZombiesTextures
    let actions:MOptionWhistlesVsZombiesActions
    private var strategy:MGameStrategyMain<MOptionWhistlesVsZombies>?
    
    required init()
    {
        whistle = MOptionWhistlesVsZombiesWhistle()
        sonicBoom = MOptionWhistlesVsZombiesSonicBoom()
        board = MOptionWhistlesVsZombiesBoard()
        textures = MOptionWhistlesVsZombiesTextures()
        actions = MOptionWhistlesVsZombiesActions()
        
        super.init()
        
        whistle.factoryWithTextures(textures:textures)
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
    
    func openBoardFor(base:MOptionWhistlesVsZombiesWhistleBase)
    {
        guard
        
            let strategy:MOptionWhistlesVsZombiesStrategyGame = self.strategy as? MOptionWhistlesVsZombiesStrategyGame
        
        else
        {
            return
        }
        
        strategy.openBoardFor(base:base)
    }
    
    func boardStrategy(strategy:MOptionWhistlesVsZombiesStrategyBoard)
    {
        self.strategy = strategy
    }
}
