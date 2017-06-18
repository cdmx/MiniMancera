import UIKit

class CHomeSplash:Controller<VHomeSplash>
{
    private(set) weak var model:MHomeOptionsProtocol!
    private(set) weak var dataOption:DOption!
    
    init(model:MHomeOptionsProtocol, dataOption:DOption)
    {
        self.model = model
        self.dataOption = dataOption
        super.init()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
