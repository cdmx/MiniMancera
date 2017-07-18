import SpriteKit

class MOptionTamalesOaxaquenos:MGame
{
    let textures:MOptionTamalesOaxaquenosTextures
    let actions:MOptionTamalesOaxaquenosActions
    let area:MOptionTamalesOaxaquenosArea
    let player:MOptionTamalesOaxaquenosPlayer
    let camera:MOptionTamalesOaxaquenosCamera
    private var strategy:MGameStrategyMain<MOptionTamalesOaxaquenos>?
    
    required init()
    {
        textures = MOptionTamalesOaxaquenosTextures()
        actions = MOptionTamalesOaxaquenosActions(textures:textures)
        area = MOptionTamalesOaxaquenosArea(textures:textures)
        player = MOptionTamalesOaxaquenosPlayer()
        camera = MOptionTamalesOaxaquenosCamera(player:player)
        
        super.init()
        
        startLevel()
    }
    
    override var startSceneType:SKScene.Type?
    {
        get
        {
            return VOptionTamalesOaxaquenosScene.self
        }
    }
    
    override func gameStrategy<T>(modelType:T) -> MGameStrategyMain<T>? where T:MGame
    {
        return strategy as? MGameStrategyMain<T>
    }
    
    override func startLevel()
    {
        super.startLevel()
        
        score = 0
        strategy = MOptionTamalesOaxaquenosStrategyBegin(model:self)
    }
    
    //MARK: public
    
    func strategyGame()
    {
        strategy = MOptionTamalesOaxaquenosStrategyGame(model:self)
        player.walk()
    }
}
