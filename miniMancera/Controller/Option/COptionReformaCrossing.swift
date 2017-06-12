import UIKit

class COptionReformaCrossing:ControllerGame<MOptionReformaCrossing>
{
    //MARK: private
    
    private func asyncShowMenu()
    {
        let alert:UIAlertController = UIAlertController(
            title:nil,
            message:nil,
            preferredStyle:UIAlertControllerStyle.actionSheet)
        
        let actionResume:UIAlertAction = UIAlertAction(
            title:
            NSLocalizedString("COptionReformaCrossing_menuResume", comment:""),
            style:
            UIAlertActionStyle.cancel)
        { [weak self] (action:UIAlertAction) in
         
            self?.resume()
        }
        
        let actionExit:UIAlertAction = UIAlertAction(
            title:
            NSLocalizedString("COptionReformaCrossing_menuExit", comment:""),
            style:
            UIAlertActionStyle.destructive)
        { [weak self] (action:UIAlertAction) in
            
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
    
    //MARK: public
    
    func showMenu()
    {
        pause()
        
        DispatchQueue.main.async
        { [weak self] in
            
            self?.asyncShowMenu()
        }
    }
}
