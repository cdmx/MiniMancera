import UIKit
import SpriteKit

class MOptionPollutedGarden:MOptionProtocol
{
    let petuniaLife:MOptionPollutedGardenPetuniaLife
    private(set) var size:CGSize
    private(set) var score:Int
    private(set) var gameActive:Bool
    private(set) var maxScore:Int
    
    required init()
    {
        size = CGSize.zero
        score = 0
        maxScore = 0
        gameActive = false
        petuniaLife = MOptionPollutedGardenPetuniaLife()
    }
    
    //MARK: public
    
    func collectedFlower()
    {
        score += 1
        
        if score > maxScore
        {
            maxScore = score
        }
    }
    
    //MARK: option protocol
    
    var soundBackground:String?
    {
        get
        {
            return nil
        }
    }
    
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
        let scene:MOptionPollutedGardenSceneGame = MOptionPollutedGardenSceneGame(
            controller:controller)
        
        return scene
    }
}
