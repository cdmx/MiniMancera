import SpriteKit

class MOptionWhistlesVsZombies:MGame
{
    let menu:MOptionWhistlesVsZombiesMenu
    let base:MOptionWhistlesVsZombiesBase
    
    required init()
    {
        menu = MOptionWhistlesVsZombiesMenu()
        base = MOptionWhistlesVsZombiesBase()
        
        super.init()
    }
    /*
    //MARK: game protocol
    
    func activateGame()
    {
        
    }
    
    func sceneWithSize(controller:UIViewController, size:CGSize) -> SKScene?
    {
        guard
            
            let controller:COptionWhistlesVsZombies = controller as? COptionWhistlesVsZombies
            
        else
        {
            return nil
        }
        
        self.size = size
        menu.update(sceneSize:size)
        base.createItems(sceneSize:size)
        
        let scene:VOptionWhistlesVsZombiesScene = VOptionWhistlesVsZombiesScene(
            controller:controller)
        
        return scene
    }*/
}
