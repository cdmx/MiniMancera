import SpriteKit

class COptionWhistlesVsZombies:ControllerGame<MOptionWhistlesVsZombies>
{
    private weak var showingMenuForBase:VOptionWhistlesVsZombiesBase?
    
    private var scene:VOptionWhistlesVsZombiesScene?
    {
        get
        {
            guard
                
                let view:SKView = self.view as? SKView
                
            else
            {
                return nil
            }
            
            let scene:VOptionWhistlesVsZombiesScene? = view.scene
                as? VOptionWhistlesVsZombiesScene
            
            return scene
        }
    }
    
    //MARK: public
    
    func showMenuFor(base:VOptionWhistlesVsZombiesBase)
    {
        self.showingMenuForBase = base
        scene?.menu.show()
    }
}
