import UIKit
import SpriteKit

class MOptionReformaCrossing:MOptionProtocol
{
    let lane:MOptionReformaCrossingLane
    private(set) var size:CGSize
    private(set) var level:Int
    private let kStartingLevel:Int = 1
    
    init()
    {
        lane = MOptionReformaCrossingLane()
        size = CGSize.zero
        level = kStartingLevel
    }
    
    //MARK: option protocol
    
    func sceneWithSize(size:CGSize) -> SKScene
    {
        self.size = size
        let scene:MOptionReformaCrossingSceneTitle = MOptionReformaCrossingSceneTitle(model:self)
        
        return scene
    }
}
