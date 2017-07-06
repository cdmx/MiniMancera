import UIKit

class COptionWhistlesVsZombiesBoard:Controller<VOptionWhistlesVsZombiesBoard>
{
    let model:MOptionWhistlesVsZombiesBoard
    private(set) weak var controllerGame:COptionWhistlesVsZombies?
    private weak var modelBase:MOptionWhistlesVsZombiesWhistleBase!
    
    init(
        controllerGame:COptionWhistlesVsZombies,
        modelBase:MOptionWhistlesVsZombiesWhistleBase)
    {
        self.controllerGame = controllerGame
        self.modelBase = modelBase
        model = MOptionWhistlesVsZombiesBoard(
            model:controllerGame.model)
        
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
    
    func whistleSelected(item:MOptionWhistlesVsZombiesBoardItemProtocol)
    {
        controllerGame?.model.whistleSelected(
            base:modelBase,
            item:item)
        
        back()
    }
}
