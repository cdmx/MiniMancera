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
    private var strategy:MGameStrategyMain<MOptionPollutedGarden>?
    
    
    let petuniaLife:MOptionPollutedGardenPetuniaLife
    private(set) var currentScore:Int
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
        
        
        
        petuniaLife = MOptionPollutedGardenPetuniaLife()
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
    
    override func activateGame()
    {
        strategy = MOptionPollutedGardenStrategyGame(model:self)
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
        score = 0
        currentScore = 0
        strategy = MOptionPollutedGardenStrategyBegin(model:self)
        plant.restart()
    }
    
    func collectedFlower()
    {
        currentScore += 1
        
        if currentScore > currentScore
        {
            score = currentScore
        }
    }
    
    
    
    
    
    
    
    
    
    
    func pollutedFlower()
    {
        currentScore -= 1
    }
    
    func allFlowersPolluted()
    {
        deActivateGame()
    }
    
    func revertChanges()
    {
        currentScore = 0
        score = 0
    }/*
    
    //MARK: option protocol
    
    func activateGame()
    {
        gameActive = true
    }
    
    func sceneWithSize(controller:UIViewController, size:CGSize) -> SKScene?
    {
        guard
            
            let controller:COptionPollutedGarden = controller as? COptionPollutedGarden
            
        else
        {
            return nil
        }
        
        self.size = size
        bubbleGenerator.updateController(controller:controller)
        let scene:VOptionPollutedGardenScene = VOptionPollutedGardenScene(
            controller:controller)
        
        return scene
    }*/
}
