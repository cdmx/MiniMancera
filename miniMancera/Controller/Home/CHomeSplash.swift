import UIKit

class CHomeSplash:Controller<VHomeSplash>
{
    private(set) weak var model:MHomeOptionsProtocol!
    
    init(model:MHomeOptionsProtocol)
    {
        self.model = model
        super.init()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
