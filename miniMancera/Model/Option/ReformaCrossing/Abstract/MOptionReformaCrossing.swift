import SpriteKit

class MOptionReformaCrossing:MGame
{
    let textures:MOptionReformaCrossingTextures
    let sounds:MOptionReformaCrossingSounds
    let laneGroup:MOptionReformaCrossingLaneGroup
    let foe:MOptionReformaCrossingFoe
    let kMaxGameTime:TimeInterval = 31
    private(set) var addedSpeed:CGFloat
    private(set) var level:Int
    private let kSoundBackground:String = "soundReformaCrossing.caf"
    private let kSpeedMultiplier:CGFloat = 50
    private let kStartingLevel:Int = 1
    
    required init()
    {
        textures = MOptionReformaCrossingTextures()
        sounds = MOptionReformaCrossingSounds()
        foe = MOptionReformaCrossingFoe()
        laneGroup = MOptionReformaCrossingLaneGroup()
        level = kStartingLevel
        addedSpeed = 0
        
        super.init()
    }
    
    override var startSceneType:SKScene.Type?
    {
        get
        {
            return VOptionReformaCrossingScene.self
        }
    }
    
    override var soundBackground:String?
    {
        get
        {
           return kSoundBackground
        }
    }
    
    override func update(elapsedTime:TimeInterval, scene:SKScene)
    {
        foe.update(elapsedTime:elapsedTime, scene:scene)
    }
    
    //MARK: public
    
    func stopAll()
    {
        deActivateGame()
        laneGroup.stopFoes()
    }
    
    func hitAndRun()
    {
        deActivateGame()
    }
    
    func revertChanges()
    {
        level = kStartingLevel
        score = 0
    }
    
    func startLevel()
    {
        laneGroup.restart()
        addedSpeed = CGFloat(level) * kSpeedMultiplier
    }
    
    func playerSuccess()
    {
        deActivateGame()
        level += 1
    }
    
    func collectedLane()
    {
        score += 1
    }
}
