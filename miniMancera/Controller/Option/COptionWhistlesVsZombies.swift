import SpriteKit

class COptionWhistlesVsZombies:ControllerGame<MOptionWhistlesVsZombies>
{
    override func viewWillAppear(_ animated:Bool)
    {
        super.viewWillAppear(animated)
        
        guard
            
            let parent:ControllerParent = parent as? ControllerParent
            
        else
        {
            return
        }
        
        parent.landscapeOrientation()
    }
    
    override func exitGame()
    {
        guard
            
            let parent:ControllerParent = parent as? ControllerParent
            
        else
        {
            return
        }
        
        parent.portraitOrientation()
        
        super.exitGame()
    }
    
    //MARK: public
    
    func showBoard(modelBase:MOptionWhistlesVsZombiesWhistleBase)
    {
        guard
            
            let parent:ControllerParent = self.parent as? ControllerParent
        
        else
        {
            return
        }
        
        pause()
        
        let controller:COptionWhistlesVsZombiesBoard = COptionWhistlesVsZombiesBoard(
            controllerGame:self,
            modelBase:modelBase)
        parent.animateOver(controller:controller)
    }
}
