import UIKit

class CHomeFroob:Controller<VHomeFroob>
{
    private(set) weak var controllerHome:CHome!
    private(set) weak var option:MHomeOptionsPurchase!
    
    init(controllerHome:CHome, option:MHomeOptionsPurchase)
    {
        self.controllerHome = controllerHome
        self.option = option
        
        super.init()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func viewDidAppear(_ animated:Bool)
    {
        super.viewDidAppear(animated)
        
        guard
        
            let view:VHomeFroob = self.view as? VHomeFroob
        
        else
        {
            return
        }
        
        view.animateShow()
    }
    
    //MARK: public
    
    func back()
    {
        guard
        
            let parent:ControllerParent = self.parent as? ControllerParent
        
        else
        {
            return
        }
        
        parent.dismissAnimateOver(completion:nil)
    }
    
    func openStore()
    {
        guard
            
            let parent:ControllerParent = self.parent as? ControllerParent
            
        else
        {
            return
        }
        
        let controllerHome:CHome = self.controllerHome
        
        parent.dismissAnimateOver
        {
            controllerHome.footerStore()
        }
    }
}
