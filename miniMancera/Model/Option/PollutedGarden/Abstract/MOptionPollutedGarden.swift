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
    
    func sceneWithSize(controller:UIViewController, size:CGSize) -> SKScene?
    {
        guard
            
            let controller:COptionReformaCrossing = controller as? COptionReformaCrossing
            
        else
        {
            return nil
        }
        
        self.size = size
        let scene:MOptionReformaCrossingSceneGame = MOptionReformaCrossingSceneGame(
            controller:controller)
        
        return scene
    }
}
