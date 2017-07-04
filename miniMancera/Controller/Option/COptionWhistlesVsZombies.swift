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
            fatalError("shit")
        }
        
        parent.landscapeOrientation()
    }
    
    override func viewWillDisappear(_ animated:Bool)
    {
        super.viewWillDisappear(animated)
        
        guard
            
            let parent:ControllerParent = parent as? ControllerParent
            
        else
        {
            fatalError("shit")
        }
        
        parent.portraitOrientation()
    }
}
