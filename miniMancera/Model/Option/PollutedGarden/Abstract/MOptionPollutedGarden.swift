import SpriteKit

class MOptionPollutedGarden:MGame
{
    let controls:MOptionPollutedGardenControls
    let bubble:MOptionPollutedGardenBubble
    let plant:MOptionPollutedGardenPlant
    let player:MOptionPollutedGardenPlayer
    let hud:MOptionPollutedGardenHud
    let menu:MOptionPollutedGardenMenu
    let title:MOptionPollutedGardenTitle
    let textures:MOptionPollutedGardenTextures
    let actions:MOptionPollutedGardenActions
    let sounds:MOptionPollutedGardenSounds
    let contact:MOptionPollutedGardenContact
    private(set) var currentScore:Int
    private var strategy:MGameStrategyMain<MOptionPollutedGarden>?
    private let kSoundBackground:String = "soundReformaCrossing.caf"
    
    required init()
    {
        controls = MOptionPollutedGardenControls()
        bubble = MOptionPollutedGardenBubble()
        plant = MOptionPollutedGardenPlant()
        player = MOptionPollutedGardenPlayer()
        hud = MOptionPollutedGardenHud()
        menu = MOptionPollutedGardenMenu()
        title = MOptionPollutedGardenTitle()
        textures = MOptionPollutedGardenTextures()
        actions = MOptionPollutedGardenActions()
        sounds = MOptionPollutedGardenSounds()
        contact = MOptionPollutedGardenContact()
        currentScore = 0
        
        super.init()
        actions.createAnimations(textures:textures)
        bubble.createTypes(textures:textures)
        plant.factoryAnimations(
            actions:actions,
            textures:textures)
    }
    
    override var startSceneType:SKScene.Type?
    {
        get
        {
            return VOptionPollutedGardenScene.self
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
        
        score = 0
        currentScore = 0
        plant.restart()
        bubble.restart()
        strategy = MOptionPollutedGardenStrategyBegin(model:self)
    }
    
    override func activateGame()
    {
        super.activateGame()
        
        strategy = MOptionPollutedGardenStrategyGame(model:self)
        player.activateGame()
    }
    
    override func gameStrategy<T>(modelType:T) -> MGameStrategyMain<T>? where T:MGame
    {
        return strategy as? MGameStrategyMain<T>
    }
    
    //MARK: private
    
    private func allPlantsPolluted()
    {
        deActivateGame()
        player.defeated()
        strategy = MOptionPollutedGardenStrategyEnd(model:self)
    }
    
    //MARK: public
    
    func collectedFlower(plantItem:MOptionPollutedGardenPlantItem)
    {
        currentScore += 1
        
        if currentScore > score
        {
            score = currentScore
        }
        
        plant.collectStart(plantItem:plantItem)
    }
    
    func poisonPlant(plantItem:MOptionPollutedGardenPlantItem)
    {
        currentScore -= 1
        plant.poisonStart(plantItem:plantItem)
        
        if currentScore < 0
        {
            currentScore = 0
            allPlantsPolluted()
        }
    }
    
    func strategyWait()
    {
        strategy = MOptionPollutedGardenStrategyWait(model:self)
    }
}
