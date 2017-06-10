import UIKit

class CHome:Controller<VHome>
{
    let model:MHome
    
    override init()
    {
        model = MHome()
        super.init()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        MSession.sharedInstance.loadSession()
    }
    
    override func viewDidAppear(_ animated:Bool)
    {
        super.viewDidAppear(animated)
        model.reload(controller:self)
    }
    
    private func confirmDelete(item:MHomeItem)
    {
        model.deleteNote(controller:self, item:item)
    }
    
    //MARK: public
    
    func newNote()
    {
        editNote(item:nil)
    }
    
    func notesLoaded()
    {
        DispatchQueue.main.async
        { [weak self] in
            
            guard
            
                let view:VHome = self?.view as? VHome
            
            else
            {
                return
            }
            
            view.stopLoading()
        }
    }
    
    func deleteNote(item:MHomeItem)
    {
        let alert:UIAlertController = UIAlertController(
            title:NSLocalizedString("CHome_deleteAlertTitle", comment:""),
            message:nil,
            preferredStyle:UIAlertControllerStyle.actionSheet)
        
        let actionCancel:UIAlertAction = UIAlertAction(
            title:
            NSLocalizedString("CHome_deleteAlertCancel", comment:""),
            style:
            UIAlertActionStyle.cancel)
        
        let actionDelete:UIAlertAction = UIAlertAction(
            title:
            NSLocalizedString("CHome_deleteAlertDelete", comment:""),
            style:
            UIAlertActionStyle.destructive)
        { [weak self] (action:UIAlertAction) in
            
            self?.confirmDelete(item:item)
        }
        
        alert.addAction(actionDelete)
        alert.addAction(actionCancel)
        
        if let popover:UIPopoverPresentationController = alert.popoverPresentationController
        {
            popover.sourceView = view
            popover.sourceRect = CGRect.zero
            popover.permittedArrowDirections = UIPopoverArrowDirection.up
        }
        
        present(alert, animated:true, completion:nil)
    }
    
    func editNote(item:MHomeItem?)
    {
        guard
            
            let parent:ControllerParent = self.parent as? ControllerParent
            
        else
        {
            return
        }
        
        let controller:CCreate = CCreate(modelHomeItem:item)
        parent.push(
            controller:controller,
            horizontal:ControllerParent.Horizontal.right)
    }
    
    func shareNote(item:MHomeItem)
    {
        guard
        
            let parent:ControllerParent = self.parent as? ControllerParent
        
        else
        {
            return
        }
        
        let controller:CShare = CShare(modelHomeItem:item)
        parent.push(
            controller:controller,
            horizontal:ControllerParent.Horizontal.right)
    }
}
