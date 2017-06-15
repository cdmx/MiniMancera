import UIKit

class CHome:Controller<VHome>
{
    let model:MHome
    
    override init()
    {
        model = MHome()
        super.init()
        
        NotificationCenter.default.addObserver(
            self,
            selector:#selector(notifiedSessionLoaded(sender:)),
            name:Notification.sessionLoaded,
            object:nil)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    deinit
    {
        NotificationCenter.default.removeObserver(self)
    }
    
    //MARK: notified
    
    func notifiedSessionLoaded(sender notification:Notification)
    {
        DispatchQueue.main.async
        { [weak self] in
            
            guard
            
                let view:VHome = self?.view as? VHome
            
            else
            {
                return
            }
            
            view.sessionLoaded()
        }
    }
    
    //MARK: public
    
    func optionSelected(option:MHomeOptionsProtocol)
    {
        let controller:UIViewController = option.gameController()
        parent?.present(controller, animated:true, completion:nil)
    }
    
    func footerBoards()
    {
        guard
        
            let parent:ControllerParent = self.parent as? ControllerParent
        
        else
        {
            return
        }
        
        let showBoards:Bool = parent.gameLeaderBoards()
        
        if !showBoards
        {
            let error:String = NSLocalizedString("CHome_errorGameBoards", comment:"")
            VAlert.messageFail(message:error)
        }
    }
}
