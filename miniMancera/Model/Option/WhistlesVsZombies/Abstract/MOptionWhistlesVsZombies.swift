import SpriteKit

class MOptionWhistlesVsZombies:MGame
{
    let whistle:MOptionWhistlesVsZombiesWhistle
    let textures:MOptionWhistlesVsZombiesTextures
    let actions:MOptionWhistlesVsZombiesActions
    
    required init()
    {
        whistle = MOptionWhistlesVsZombiesWhistle()
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
}
