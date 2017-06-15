import UIKit
import SpriteKit

class MOptionPollutedGarden:MOptionProtocol
{
    private(set) var size:CGSize
    private(set) var score:Int
    private(set) var gameActive:Bool
    
    required init()
    {
        size = CGSize.zero
        score = 0
        gameActive = false
    }
    
    //MARK: option protocol
    
    var soundBackground:String?
    {
        get
        {
            return nil
        }
    }
    
    func sceneWithSize(controller:UIViewController, size:CGSize) -> SKScene?
    {
        guard
            
            let controller:COptionPollutedGarden = controller as? COptionPollutedGarden
            
        else
        {
            return nil
        }
        
        self.size = size
        let scene:MOptionPollutedGardenSceneGame = MOptionPollutedGardenSceneGame(
            controller:controller)
        
        return scene
    }
}
