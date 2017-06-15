import UIKit

class CHome:Controller<VHome>
{
    let model:MHome
    
    override init()
    {
        model = MHome()
        super.init()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
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
