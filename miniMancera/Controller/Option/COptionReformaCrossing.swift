import UIKit

class COptionReformaCrossing:ControllerGame<MOptionReformaCrossing>
{
    //MARK: public
    
    func showMenu()
    {
        let alert:UIAlertController = UIAlertController(
            title:nil,
            message:nil,
            preferredStyle:UIAlertControllerStyle.actionSheet)
        
        let actionResume:UIAlertAction = UIAlertAction(
            title:
            NSLocalizedString("COptionReformaCrossing_menuResume", comment:""),
            style:
            UIAlertActionStyle.default)
        
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
}
