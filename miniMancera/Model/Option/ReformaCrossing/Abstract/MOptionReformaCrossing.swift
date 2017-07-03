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
    
    override func startLevel()
    {
        super.startLevel()
        
        strategy = MOptionReformaCrossingStrategyBegin(model:self)
        title.startLevel(level:level)
        laneGroup.restart(level:level)
        coin.chargeCoinsWith(laneGroup:laneGroup)
    }
    
    override func activateGame()
    {
        super.activateGame()
        
        strategy = MOptionReformaCrossingStrategyGame(model:self)
        player.activateGame()
    }
    
    override func gameStrategy<T>(modelType:T) -> MGameStrategyMain<T>? where T:MGame
    {
        return strategy as? MGameStrategyMain<T>
    }
    
    //MARK: public
    
    func playerSuccess()
    {
        player.success()
        deActivateGame()
        level += 1
        strategy = MOptionReformaCrossingStrategyEndSuccess(model:self)
    }
    
    func timeOut()
    {
        player.timeOut()
        deActivateGame()
        strategy = MOptionReformaCrossingStrategyEndFailTimeOut(model:self)
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
    
    func hitAndRun(scene:ViewGameScene<MOptionReformaCrossing>)
    {
        let soundFail:SKAction = sounds.soundHonk
        scene.controller.playSound(actionSound:soundFail)
        
        player.hitAndRun()
        deActivateGame()
        strategy = MOptionReformaCrossingStrategyEndFailHitAndRun(model:self)
    }
}
