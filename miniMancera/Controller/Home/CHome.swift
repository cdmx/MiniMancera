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
}
