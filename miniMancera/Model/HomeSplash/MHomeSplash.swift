import Foundation

class MHomeSplash
{
    private(set) weak var optionModel:MHomeOptionsProtocol!
    let items:[MHomeSplashProtocol]
    
    init(model:MHomeOptionsProtocol)
    {
        self.optionModel = model
        let itemDescr:MHomeSplashDescr = MHomeSplashDescr(model:model)
        
        items = [
            itemDescr]
    }
}
