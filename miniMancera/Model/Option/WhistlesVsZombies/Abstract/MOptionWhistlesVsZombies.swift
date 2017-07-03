import SpriteKit

class MOptionWhistlesVsZombies:MGame
{
    let textures:MOptionWhistlesVsZombiesTextures
    
    required init()
    {
        textures = MOptionWhistlesVsZombiesTextures()
        
        super.init()
    }
    
    override var startSceneType:SKScene.Type?
    {
        get
        {
            return VOptionPollutedGardenScene.self
        }
    }
}
