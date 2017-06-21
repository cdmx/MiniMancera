import UIKit
import SpriteKit

class MOptionReformaCrossing:MGameProtocol
{
    let laneGroup:MOptionReformaCrossingLaneGroup
    let kMaxGameTime:TimeInterval = 31
    private(set) var addedSpeed:CGFloat
    private(set) var level:Int
    private(set) var size:CGSize
    private(set) var score:Int
    private(set) var gameActive:Bool
    private let kSoundBackground:String = "soundReformaCrossing.caf"
    private let kSpeedMultiplier:CGFloat = 50
    private let kStartingLevel:Int = 1
    
    required init()
    {
        laneGroup = MOptionReformaCrossingLaneGroup()
        size = CGSize.zero
        score = 0
        gameActive = false
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
    
    var soundBackground:String?
    {
        get
        {
            return kSoundBackground
        }
    }
    
    func activateGame()
    {
        gameActive = true
    }
    
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
