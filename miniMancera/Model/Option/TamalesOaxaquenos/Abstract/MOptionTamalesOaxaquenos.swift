import SpriteKit

class MOptionTamalesOaxaquenos:MGame
{
    let textures:MOptionTamalesOaxaquenosTextures
    let actions:MOptionTamalesOaxaquenosActions
    let area:MOptionTamalesOaxaquenosArea
    let player:MOptionTamalesOaxaquenosPlayer
    private var strategy:MGameStrategyMain<MOptionTamalesOaxaquenos>?
    
    required init()
    {
        textures = MOptionTamalesOaxaquenosTextures()
        actions = MOptionTamalesOaxaquenosActions(textures:textures)
        area = MOptionTamalesOaxaquenosArea(textures:textures)
        player = MOptionTamalesOaxaquenosPlayer()
        
        super.init()
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
}
