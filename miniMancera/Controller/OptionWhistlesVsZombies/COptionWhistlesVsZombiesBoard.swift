import UIKit

class COptionWhistlesVsZombiesBoard:Controller<VOptionWhistlesVsZombiesBoard>
{
    private weak var modelBase:MOptionWhistlesVsZombiesWhistleBase!
    
    init(modelBase:MOptionWhistlesVsZombiesWhistleBase)
    {
        self.modelBase = modelBase
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
        
        parent.dismissAnimateOver(completion:nil)
    }
}
