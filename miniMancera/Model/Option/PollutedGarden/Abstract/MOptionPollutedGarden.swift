import SpriteKit

class MOptionPollutedGarden:MGame
{
    let plant:MOptionPollutedGardenPlant
    let textures:MOptionPollutedGardenTextures
    let contact:MOptionPollutedGardenContact
    
    
    
    let petuniaLife:MOptionPollutedGardenPetuniaLife
    let bubbleGenerator:MOptionPollutedGardenBubbleGenerator
    private(set) var currentScore:Int
    private var strategy:MGameStrategyMain<MOptionPollutedGarden>?
    private let kSoundBackground:String = "soundReformaCrossing.caf"
    
    required init()
    {
        plant = MOptionPollutedGardenPlant()
        textures = MOptionPollutedGardenTextures()
        contact = MOptionPollutedGardenContact()
        
        
        
        petuniaLife = MOptionPollutedGardenPetuniaLife()
        bubbleGenerator = MOptionPollutedGardenBubbleGenerator()
        currentScore = 0
        super.init()
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
        strategy = MOptionPollutedGardenStrategyBegin(model:self)
//        player.activateGame()
        
        super.activateGame()
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
        score = 0
        currentScore = 0
        strategy = MOptionPollutedGardenStrategyBegin(model:self)
        plant.restart(textures:textures)
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
