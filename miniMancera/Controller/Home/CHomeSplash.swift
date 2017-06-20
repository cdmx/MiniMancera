import UIKit

class CHomeSplash:Controller<VHomeSplash>
{
    let model:MHomeSplash
    private(set) weak var modelOption:MHomeOptions!
    private(set) weak var dataOption:DOption?
    
    init(model:MHomeOptions)
    {
        self.model = MHomeSplash(model:model)
        self.modelOption = model
        self.dataOption = model.dataOption
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
            
            let controller:UIViewController = modelOption.gameController()
        
        else
        {
            return
        }
        
        /*
        guard
            
            let controller:UIViewController = model.optionModel.selected()
            
        else
        {
            return
        }*/
        
        parent?.present(controller, animated:true, completion:nil)
    }
}
