import UIKit
import SpriteKit

class MOptionReformaCrossing:MOptionProtocol
{
    //MARK: option protocol
    
    func sceneWithSize(size:CGSize) -> SKScene
    {
        let scene:MOptionReformaCrossingScene = MOptionReformaCrossingScene(size:size)
        
        return scene
    }
}
