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
        
        if parent.supportedInterfaceOrientations != UIInterfaceOrientationMask.landscape
        {
            parent.landscapeOrientation()
        }
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
    
    override func didBegin(_ contact:SKPhysicsContact)
    {
        model.contact.addContact(contact:contact)
    }
    
    //MARK: private
    
    private func asyncShowBoard(modelBase:MOptionWhistlesVsZombiesWhistleBase)
    {
        guard
            
            let parent:ControllerParent = self.parent as? ControllerParent
            
        else
        {
            return
        }
        
        let controller:COptionWhistlesVsZombiesBoard = COptionWhistlesVsZombiesBoard(
            controllerGame:self,
            modelBase:modelBase)
        parent.animateOver(controller:controller)
    }
    
    //MARK: public
    
    func showBoard(modelBase:MOptionWhistlesVsZombiesWhistleBase)
    {
        pause()
        
        DispatchQueue.main.async
        { [weak self] in
            
            self?.asyncShowBoard(modelBase:modelBase)
        }
    }
}
