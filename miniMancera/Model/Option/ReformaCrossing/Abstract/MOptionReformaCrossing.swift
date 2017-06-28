import SpriteKit

class MOptionReformaCrossing:MGame
{
    let contact:MOptionReformaCrossingContact
    let textures:MOptionReformaCrossingTextures
    let sounds:MOptionReformaCrossingSounds
    let actions:MOptionReformaCrossingActions
    let laneGroup:MOptionReformaCrossingLaneGroup
    let player:MOptionReformaCrossingPlayer
    let foe:MOptionReformaCrossingFoe
    let stop:MOptionReformaCrossingStop
    let hud:MOptionReformaCrossingHud
    let title:MOptionReformaCrossingTitle
    private(set) var level:Int
    private var strategy:MGameStrategy<MOptionReformaCrossing>?
    private let kSoundBackground:String = "soundReformaCrossing.caf"
    private let kStartingLevel:Int = 1
    
    required init()
    {
        contact = MOptionReformaCrossingContact()
        textures = MOptionReformaCrossingTextures()
        sounds = MOptionReformaCrossingSounds()
        actions = MOptionReformaCrossingActions()
        laneGroup = MOptionReformaCrossingLaneGroup()
        player = MOptionReformaCrossingPlayer()
        foe = MOptionReformaCrossingFoe()
        stop = MOptionReformaCrossingStop()
        hud = MOptionReformaCrossingHud()
        title = MOptionReformaCrossingTitle()
        level = kStartingLevel
        
        super.init()
        
        actions.createStopAnimation(textureAnimated:textures.stopAnimated)
        strategy = MOptionReformaCrossingStrategyBegin(model:self)
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
            scene:scene)
    }
    
    //MARK: public
    
    func startLevel()
    {
        title.startLevel(level:level)
        laneGroup.restart(level:level)
    }
    
    override func activateGame()
    {
        strategy = MOptionReformaCrossingStrategyGame(model:self)
        super.activateGame()
    }
    
    func timeOut()
    {
        let gameOver:MOptionReformaCrossingGameOverTimeOut = MOptionReformaCrossingGameOverTimeOut()
        deActivateGame()
        laneGroup.stopFoes()
        strategy = MOptionReformaCrossingStrategyEndFail(model:self, gameOver:gameOver)
    }
    
    func strategyWait()
    {
        strategy = MOptionReformaCrossingStrategyWait(model:self)
    }
    
    func revertChanges()
    {
        strategy = MOptionReformaCrossingStrategyBegin(model:self)
        level = kStartingLevel
        score = 0
        hud.restart()
        foe.restart()
    }
    
    func playerStop()
    {
        stop.playerStop()
    }
    
    
    
    
    
    
    func hitAndRun()
    {
        deActivateGame()
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
