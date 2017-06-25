import SpriteKit

class MOptionReformaCrossing:MGame
{
    let laneGroup:MOptionReformaCrossingLaneGroup
    let kMaxGameTime:TimeInterval = 31
    private(set) var addedSpeed:CGFloat
    private(set) var level:Int
    private let kSoundBackground:String = "soundReformaCrossing.caf"
    private let kSpeedMultiplier:CGFloat = 50
    private let kStartingLevel:Int = 1
    
    required init()
    {
        super.init()
        
        laneGroup = MOptionReformaCrossingLaneGroup()
        level = kStartingLevel
        addedSpeed = 0
    }
    
    override var startSceneType:ViewGameScene<MGame>.Type?
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
        laneGroup.configureForScene(size:size)
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
