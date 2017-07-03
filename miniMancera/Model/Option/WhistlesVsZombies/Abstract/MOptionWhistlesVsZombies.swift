import SpriteKit

class MOptionWhistlesVsZombies:MGame
{
    let whistle:MOptionWhistlesVsZombiesWhistle
    let board:MOptionWhistlesVsZombiesBoard
    let textures:MOptionWhistlesVsZombiesTextures
    let actions:MOptionWhistlesVsZombiesActions
    private var strategy:MGameStrategyMain<MOptionWhistlesVsZombies>?
    
    required init()
    {
        whistle = MOptionWhistlesVsZombiesWhistle()
        board = MOptionWhistlesVsZombiesBoard()
        textures = MOptionWhistlesVsZombiesTextures()
        actions = MOptionWhistlesVsZombiesActions()
        
        super.init()
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
        
        strategy = MOptionWhistlesVsZombiesStrategyGame(model:self)
    }
    
    override func gameStrategy<T>(modelType:T) -> MGameStrategyMain<T>? where T:MGame
    {
        return strategy as? MGameStrategyMain<T>
    }
    
    //MARK: public
    
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
