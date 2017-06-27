import SpriteKit

extension ControllerGame
{
    func showMenu()
    {
        if model.gameActive
        {
            pause()
            stopTimer()
            
            DispatchQueue.main.async
            { [weak self] in
                
                self?.asyncShowMenu()
            }
        }
    }
    
    func pause()
    {
        guard
            
            let view:SKView = self.view as? SKView
            
        else
        {
            return
        }
        
        view.isPaused = true
    }
    
    func resume()
    {
        guard
            
            let view:SKView = self.view as? SKView
            
        else
        {
            return
        }
        
        view.isPaused = false
    }
    
    func exitGame()
    {
        guard
            
            let parent:ControllerParent = self.parent as? ControllerParent
            
        else
        {
            return
        }
        
        parent.pop(vertical:ControllerParent.Vertical.bottom)
    }
    
    func exitGameAndPostScore()
    {
        postScore()
        exitGame()
    }
    
    //MARK: private
    
    private func asyncShowMenu()
    {
        let alert:UIAlertController = UIAlertController(
            title:nil,
            message:nil,
            preferredStyle:UIAlertControllerStyle.actionSheet)
        
        let actionResume:UIAlertAction = UIAlertAction(
            title:
            String.localized(key:"ControllerGame_menuResume"),
            style:
            UIAlertActionStyle.cancel)
        { [weak self] (action:UIAlertAction) in
            
            self?.resume()
        }
        
        let actionExit:UIAlertAction = UIAlertAction(
            title:
            String.localized(key:"ControllerGame_menuExit"),
            style:
            UIAlertActionStyle.destructive)
        { [weak self] (action:UIAlertAction) in
            
            self?.exitGameAndPostScore()
        }
        
        alert.addAction(actionResume)
        alert.addAction(actionExit)
        
        if let popover:UIPopoverPresentationController = alert.popoverPresentationController
        {
            popover.sourceView = view
            popover.sourceRect = CGRect.zero
            popover.permittedArrowDirections = UIPopoverArrowDirection.up
        }
        
        present(alert, animated:true, completion:nil)
    }
}
