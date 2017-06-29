import SpriteKit

class COptionPollutedGarden:ControllerGame<MOptionPollutedGarden>
{
    override func didBegin(_ contact:SKPhysicsContact)
    {
        model.contact.addContact(contact:contact)
    }
    
    //MARK: public
    
    func collectFlower(petunia:VOptionPollutedGardenPetunia)
    {
        guard
            
            let view:SKView = self.view as? SKView,
            let scene:VOptionPollutedGardenScene = view.scene as? VOptionPollutedGardenScene
            
        else
        {
            return
        }
        
//        model.collectedFlower()
        scene.collectFlower(petunia:petunia)
    }
    
    func pollutedFlower(petunia:VOptionPollutedGardenPetunia)
    {
        guard
            
            let view:SKView = self.view as? SKView,
            let scene:VOptionPollutedGardenScene = view.scene as? VOptionPollutedGardenScene
            
        else
        {
            return
        }
        
        scene.flowerPolluted(petunia:petunia)
        /*
        if model.score > 0
        {
            model.pollutedFlower()
        }
        else
        {
            model.allFlowersPolluted()
            scene.allFlowersPolluted()
            
            postScore()
        }*/
    }
    
    func game1up()
    {
        guard
            
            let view:SKView = self.view as? SKView,
            let scene:VOptionPollutedGardenSceneEnd = view.scene as? VOptionPollutedGardenSceneEnd
            
        else
        {
            return
        }
        /*
        model.revertChanges()
        scene.game1up()*/
    }
}
