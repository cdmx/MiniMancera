import SpriteKit

class MOptionReformaCrossing:MGame
{
    typealias modelType = MOptionReformaCrossing
    
    let contact:MOptionReformaCrossingContact
    let textures:MOptionReformaCrossingTextures
    let sounds:MOptionReformaCrossingSounds
    let actions:MOptionReformaCrossingActions
    let laneGroup:MOptionReformaCrossingLaneGroup
    let player:MOptionReformaCrossingPlayer
    let foe:MOptionReformaCrossingFoe
    let coin:MOptionReformaCrossingCoin
    let stop:MOptionReformaCrossingStop
    let hud:MOptionReformaCrossingHud
    let menu:MOptionReformaCrossingMenu
    let title:MOptionReformaCrossingTitle
    private(set) var level:Int
    private var strategy:MGameStrategyMain<MOptionReformaCrossing>?
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
        coin = MOptionReformaCrossingCoin()
        stop = MOptionReformaCrossingStop()
        hud = MOptionReformaCrossingHud()
        menu = MOptionReformaCrossingMenu()
        title = MOptionReformaCrossingTitle()
        level = kStartingLevel
        
        super.init()
        actions.createAnimations(textures:textures)
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
    
    override func activateGame()
    {
        strategy = MOptionReformaCrossingStrategyGame(model:self)
        player.activateGame()
        
        super.activateGame()
    }
    
    override func gameStrategy<T>(modelType:T) -> MGameStrategyMain<T>? where T:MGame
    {
        return strategy as? MGameStrategyMain<T>
    }
    
    //MARK: public
    
    func startLevel()
    {
        strategy = MOptionReformaCrossingStrategyBegin(model:self)
        title.startLevel(level:level)
        laneGroup.restart(level:level)
        coin.chargeCoinsWith(laneGroup:laneGroup)
    }
    
    func playerSuccess()
    {
        player.success()
        deActivateGame()
        level += 1
        strategy = MOptionReformaCrossingStrategyEndSuccess(model:self)
    }
    
    func timeOut()
    {
        let gameOver:MOptionReformaCrossingGameOverTimeOut = MOptionReformaCrossingGameOverTimeOut()
        
        player.timeOut()
        deActivateGame()
        strategy = MOptionReformaCrossingStrategyEndFail(
            model:self,
            gameOver:gameOver)
    }
    
    func strategyWait()
    {
        strategy = MOptionReformaCrossingStrategyWait(model:self)
    }
    
    func revertChanges()
    {
        level = kStartingLevel
        score = 0
    }
    
    func playerStop()
    {
        player.stop()
        stop.playerStop()
    }
    
    func addCoin()
    {
        score += 1
    }
    
    func hitAndRun(scene:VOptionReformaCrossingScene)
    {
        let soundFail:SKAction = sounds.soundHonk
        scene.controller.playSound(actionSound:soundFail)
        
        let gameOver:MOptionReformaCrossingGameOverHitAndRun = MOptionReformaCrossingGameOverHitAndRun()
        
        player.hitAndRun()
        deActivateGame()
        strategy = MOptionReformaCrossingStrategyEndFail(
            model:self,
            gameOver:gameOver)
    }
}
