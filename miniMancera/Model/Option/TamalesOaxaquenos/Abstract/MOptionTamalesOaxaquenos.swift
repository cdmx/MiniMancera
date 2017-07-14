import SpriteKit

class MOptionTamalesOaxaquenos:MGame
{
    let area:MOptionTamalesOaxaquenosArea
    
    required init()
    {
        area = MOptionTamalesOaxaquenosArea()
        
        super.init()
    }
    
    override var startSceneType:SKScene.Type?
    {
        get
        {
            return VOptionTamalesOaxaquenosScene.self
        }
    }
}
