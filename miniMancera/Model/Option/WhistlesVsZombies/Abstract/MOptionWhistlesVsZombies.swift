import SpriteKit

class MOptionWhistlesVsZombies:MGameProtocol
{
    private(set) var soundBackground:String?
    private(set) var size:CGSize
    private(set) var score:Int
    private(set) var gameActive:Bool
    
    required init()
    {
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
        let scene:VOptionWhistlesVsZombiesScene = VOptionWhistlesVsZombiesScene(
            controller:controller)
        
        return scene
    }
}
