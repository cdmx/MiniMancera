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
        model.refreshOptions()
        
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
    
    //MARK: private
    
    private func showSplash(option:MHomeOptionsProtocol)
    {
        guard
            
            let parent:ControllerParent = self.parent as? ControllerParent
            
        else
        {
            return
        }
        
        let controller:CHomeSplash = CHomeSplash(model:option)
        parent.push(
            controller:controller,
            horizontal:ControllerParent.Horizontal.right)
    }
    
    private func showFroob(option:MHomeOptionsProtocol)
    {
        guard
            
            let parent:ControllerParent = self.parent as? ControllerParent,
            let option:MHomeOptionsPurchase = option as? MHomeOptionsPurchase
            
        else
        {
            return
        }
        
        let controller:CHomeFroob = CHomeFroob(
            controllerHome:self,
            option:option)
        parent.push(
            controller:controller,
            horizontal:ControllerParent.Horizontal.right)
    }
    
    //MARK: public
    
    func optionSelected(option:MHomeOptionsProtocol)
    {
        if option.available
        {
            showSplash(option:option)
        }
        else
        {
            showFroob(option:option)
        }
    }
    
    func footerSettings()
    {
        guard
            
            let parent:ControllerParent = self.parent as? ControllerParent
            
        else
        {
            return
        }
        
        
        let controller:CSettings = CSettings()
        parent.push(
            controller:controller,
            horizontal:ControllerParent.Horizontal.right)
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
            let error:String = String.localized(key:"CHome_errorGameBoards")
            VAlert.messageFail(message:error)
        }
    }
    
    func footerStore()
    {
        guard
            
            let parent:ControllerParent = self.parent as? ControllerParent
            
        else
        {
            return
        }
        
        let options:[MHomeOptionsPurchase] = model.purchaseOptions()
        
        let controller:CStore = CStore(options:options)
        parent.push(
            controller:controller,
            horizontal:ControllerParent.Horizontal.right)
    }
}
