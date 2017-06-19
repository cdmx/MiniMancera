import UIKit

class CHomeSplash:Controller<VHomeSplash>
{
    let model:MHomeSplash
    
    init(model:MHomeOptionsProtocol)
    {
        model = MHomeSplash(model:model)
        super.init()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func viewDidAppear(_ animated:Bool)
    {
        super.viewDidDisappear(animated)
        
        guard
        
            let view:VHomeSplash = self.view as? VHomeSplash
        
        else
        {
            return
        }
        
        view.refresh()
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
        
        parent.pop(horizontal:ControllerParent.Horizontal.right)
    }
    
    func play()
    {
        guard
            
            let controller:UIViewController = model.selected()
            
        else
        {
            return
        }
        
        parent?.present(controller, animated:true, completion:nil)
    }
}
