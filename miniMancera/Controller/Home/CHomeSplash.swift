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
        
            let dataOption:DOption = model.modelOption.dataOption,
            let gameControllerType:UIViewController.Type = model.modelOption.gameControllerType,
            let specialGameControllerType:ControllerGame.Type = gameControllerType as? ControllerGame.Type
        
        else
        {
            return
        }
        
        let controller:ControllerGame = specialGameControllerType.init(dataOption:dataOption)
        
        parent?.present(controller, animated:true, completion:nil)
    }
}
