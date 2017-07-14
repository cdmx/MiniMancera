import SpriteKit

class MOptionTamalesOaxaquenos:MGame
{
    let textures:MOptionTamalesOaxaquenosTextures
    let area:MOptionTamalesOaxaquenosArea
    
    required init()
    {
        textures = MOptionTamalesOaxaquenosTextures()
        area = MOptionTamalesOaxaquenosArea(textures:textures)
        
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
