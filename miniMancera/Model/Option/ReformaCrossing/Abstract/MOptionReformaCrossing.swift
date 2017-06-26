import SpriteKit

class MOptionReformaCrossing:MGame
{
    let textures:MOptionReformaCrossingTextures
    let sounds:MOptionReformaCrossingSounds
    let actions:MOptionReformaCrossingActions
    let laneGroup:MOptionReformaCrossingLaneGroup
    let foe:MOptionReformaCrossingFoe
    let hud:MOptionReformaCrossingHud
    let title:MOptionReformaCrossingTitle
    private(set) var addedSpeed:CGFloat
    private(set) var level:Int
    private var strategy:MOptionReformaCrossingStrategy?
    private let kSoundBackground:String = "soundReformaCrossing.caf"
    private let kSpeedMultiplier:CGFloat = 50
    private let kStartingLevel:Int = 1
    
    required init()
    {
        textures = MOptionReformaCrossingTextures()
        sounds = MOptionReformaCrossingSounds()
        actions = MOptionReformaCrossingActions()
        laneGroup = MOptionReformaCrossingLaneGroup()
        foe = MOptionReformaCrossingFoe()
        hud = MOptionReformaCrossingHud()
        title = MOptionReformaCrossingTitle()
        strategy = MOptionReformaCrossingStrategyBegin()
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
        strategy?.update(
            elapsedTime:elapsedTime,
            scene:scene,
            model:self)
        foe.update(elapsedTime:elapsedTime, scene:scene)
    }
    
    //MARK: public
    
    override func activateGame()
    {
        strategy = MOptionReformaCrossingStrategyGame()
        super.activateGame()
    }
    
    
    
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
        title.startLevel(level:level)
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
