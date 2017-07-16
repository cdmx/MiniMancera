import SpriteKit

class MOptionTamalesOaxaquenos:MGame
{
    let textures:MOptionTamalesOaxaquenosTextures
    let action:MOptionTamalesOaxaquenosActions
    let area:MOptionTamalesOaxaquenosArea
    let player:MOptionTamalesOaxaquenosPlayer
    
    required init()
    {
        textures = MOptionTamalesOaxaquenosTextures()
        action = MOptionTamalesOaxaquenosActions(textures:textures)
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
}
