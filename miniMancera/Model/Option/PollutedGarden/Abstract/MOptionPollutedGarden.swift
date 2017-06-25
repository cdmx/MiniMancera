import SpriteKit

class MOptionPollutedGarden:MGame
{
    let petuniaLife:MOptionPollutedGardenPetuniaLife
    let bubbleGenerator:MOptionPollutedGardenBubbleGenerator
    private(set) var currentScore:Int
    private let kSoundBackground:String = "soundReformaCrossing.caf"
    
    required init()
    {
        petuniaLife = MOptionPollutedGardenPetuniaLife()
        bubbleGenerator = MOptionPollutedGardenBubbleGenerator()
        currentScore = 0
        super.init()
    }
    
    override var startSceneType:ViewGameScene<MGame>.Type?
    {
        get
        {
            return VOptionPollutedGardenScene<MOptionPollutedGarden>.self
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
