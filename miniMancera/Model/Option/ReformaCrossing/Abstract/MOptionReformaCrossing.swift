import UIKit
import SpriteKit

class MOptionReformaCrossing:MOptionProtocol
{
    let laneGroup:MOptionReformaCrossingLaneGroup
    let kMaxGameTime:TimeInterval = 60
    private(set) var gameActive:Bool
    private(set) var size:CGSize
    private(set) var level:Int
    private let kStartingLevel:Int = 1
    private let kSpeedMultiplier:Int = 40
    
    required init()
    {
        gameActive = false
        laneGroup = MOptionReformaCrossingLaneGroup()
        size = CGSize.zero
        level = kStartingLevel
    }
    
    //MARK: public
    
    func levelAddedMaxSpeed() -> UInt32
    {
        let multipliedSpeed:UInt32 = UInt32(level * kSpeedMultiplier)
        
        return multipliedSpeed
    }
    
    func gameOver()
    {
        gameActive = false
        laneGroup.stopFoes()
    }
    
    func revertChanges()
    {
        level = kStartingLevel
    }
    
    func startLevel()
    {
        laneGroup.configureForScene(size:size)
    }
    
    func activateGame()
    {
        gameActive = true
    }
    
    //MARK: option protocol
    
    func sceneWithSize(
        controller:UIViewController,
        size:CGSize) -> SKScene?
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
