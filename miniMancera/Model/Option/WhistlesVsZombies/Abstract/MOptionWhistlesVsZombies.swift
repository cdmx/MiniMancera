import SpriteKit

class MOptionWhistlesVsZombies:MGame
{
    let whistle:MOptionWhistlesVsZombiesWhistle
    let textures:MOptionWhistlesVsZombiesTextures
    let actions:MOptionWhistlesVsZombiesActions
    private var strategy:MGameStrategyMain<MOptionWhistlesVsZombies>?
    
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
    
    //MARK: public
    
    
}
