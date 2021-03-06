import UIKit

class CHomeSplash:Controller<VHomeSplash>
{
    let model:MHomeSplash
    
    init(modelOption:MHomeOptions)
    {
        self.model = MHomeSplash(modelOption:modelOption)
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
        
            let controller:UIViewController = model.modelOption.gameController(),
            let parent:ControllerParent = self.parent as? ControllerParent
        
        else
        {
            return
        }
        
        parent.push(
            controller:controller,
            vertical:ControllerParent.Vertical.bottom)
    }
}
