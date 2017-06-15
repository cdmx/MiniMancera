import UIKit
import SpriteKit

class MOptionPollutedGarden:MOptionProtocol
{
    required init()
    {
        
    }
    
    //MARK: option protocol
    
    var size:CGSize
    {
        get
        {
            return CGSize.zero
        }
    }
    
    var score:Int
    {
        get
        {
            return 0
        }
    }
    
    var gameActive:Bool
    {
        get
        {
            return false
        }
    }
    
    func sceneWithSize(controller: UIViewController, size: CGSize) -> SKScene?
    {
        return nil
    }
}
