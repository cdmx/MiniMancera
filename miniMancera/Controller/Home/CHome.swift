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
}
