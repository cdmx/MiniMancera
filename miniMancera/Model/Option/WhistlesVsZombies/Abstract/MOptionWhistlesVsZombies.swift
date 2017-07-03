import SpriteKit

class MOptionWhistlesVsZombies:MGame
{
    let whistle:MOptionWhistlesVsZombiesWhistle
    let textures:MOptionWhistlesVsZombiesTextures
    
    required init()
    {
        whistle = MOptionWhistlesVsZombiesWhistle()
        textures = MOptionWhistlesVsZombiesTextures()
        
        super.init()
    }
    
    override var startSceneType:SKScene.Type?
    {
        get
        {
            return VOptionWhistlesVsZombiesScene.self
        }
    }
}
