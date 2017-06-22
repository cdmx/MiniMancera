import SpriteKit

class MOptionWhistlesVsZombies:MGameProtocol
{
    let menu:MOptionWhistlesVsZombiesMenu
    let base:MOptionWhistlesVsZombiesBase
    private(set) var soundBackground:String?
    private(set) var size:CGSize
    private(set) var score:Int
    private(set) var gameActive:Bool
    
    required init()
    {
        menu = MOptionWhistlesVsZombiesMenu()
        base = MOptionWhistlesVsZombiesBase()
        size = CGSize.zero
        score = 0
        gameActive = false
    }
    
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
        base.createItems(sceneSize:size)
        
        let scene:VOptionWhistlesVsZombiesScene = VOptionWhistlesVsZombiesScene(
            controller:controller)
        
        return scene
    }
}
