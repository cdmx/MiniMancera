import UIKit
import SpriteKit

class MOptionReformaCrossing:MOptionProtocol
{
    private(set) var size:CGSize
    private(set) var score:Int
    private(set) var gameActive:Bool
    
    let laneGroup:MOptionReformaCrossingLaneGroup
    let kMaxGameTime:TimeInterval = 31
    private(set) var addedSpeed:CGFloat
    private(set) var level:Int
    private let kSpeedMultiplier:CGFloat = 50
    private let kStartingLevel:Int = 1
    
    required init()
    {
        size = CGSize.zero
        score = 0
        gameActive = false
        
        laneGroup = MOptionReformaCrossingLaneGroup()
        level = kStartingLevel
        addedSpeed = 0
    }
    
    //MARK: public
    
    func stopAll()
    {
        gameActive = false
        laneGroup.stopFoes()
    }
    
    func hitAndRun()
    {
        gameActive = false
    }
    
    func revertChanges()
    {
        level = kStartingLevel
        score = 0
    }
    
    func startLevel()
    {
        laneGroup.configureForScene(size:size)
        addedSpeed = CGFloat(level) * kSpeedMultiplier
    }
    
    func activateGame()
    {
        gameActive = true
    }
    
    func playerSuccess()
    {
        gameActive = false
        level += 1
    }
    
    func collectedLane()
    {
        score += 1
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
