import SpriteKit

class MOptionTamalesOaxaquenos:MGame
{
    let textures:MOptionTamalesOaxaquenosTextures
    let action:MOptionTamalesOaxaquenosActions
    let area:MOptionTamalesOaxaquenosArea
    
    required init()
    {
        textures = MOptionTamalesOaxaquenosTextures()
        action = MOptionTamalesOaxaquenosActions(textures:textures)
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
