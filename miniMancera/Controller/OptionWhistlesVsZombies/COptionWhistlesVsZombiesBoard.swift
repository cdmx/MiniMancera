import UIKit

class COptionWhistlesVsZombiesBoard:Controller<VOptionWhistlesVsZombiesBoard>
{
    private weak var controllerGame:COptionWhistlesVsZombies?
    private weak var modelBase:MOptionWhistlesVsZombiesWhistleBase!
    let model:MOptionWhistlesVsZombiesBoard
    
    init(
        controllerGame:COptionWhistlesVsZombies,
        modelBase:MOptionWhistlesVsZombiesWhistleBase)
    {
        self.controllerGame = controllerGame
        self.modelBase = modelBase
        model = MOptionWhistlesVsZombiesBoard()
        
        super.init()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
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
        
        parent.dismissAnimateOver
        { [weak self] in
            
            self?.controllerGame?.resume()
        }
    }
}
