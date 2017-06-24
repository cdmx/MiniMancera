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
        showingMenuForBase = base
        scene?.menu.show()
    }
    
    func hideMenuForBase()
    {
        showingMenuForBase = nil
        scene?.menu.hide()
    }
    
    func selectWhistleForBase(whistle:MOptionWhistlesVsZombiesMenuItem)
    {
        showingMenuForBase?.charged()
        showingMenuForBase = nil
        scene?.menu.hide()
    }
}
