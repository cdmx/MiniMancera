import UIKit
import SpriteKit

class MOptionReformaCrossing:MOptionProtocol
{
    let lane:MOptionReformaCrossingLane
    private(set) var size:CGSize
    private(set) var level:Int
    private let kStartingLevel:Int = 1
    private let kSpeedMultiplier:Int = 30
    
    init()
    {
        lane = MOptionReformaCrossingLane()
        size = CGSize.zero
        level = kStartingLevel
    }
    
    //MARK: public
    
    func levelAddedMaxSpeed() -> UInt32
    {
        let multipliedSpeed:UInt32 = UInt32(level * kSpeedMultiplier)
        
        return multipliedSpeed
    }
    
    //MARK: option protocol
    
    func sceneWithSize(size:CGSize) -> SKScene
    {
        self.size = size
        let scene:MOptionReformaCrossingSceneTitle = MOptionReformaCrossingSceneTitle(model:self)
        
        return scene
    }
}
