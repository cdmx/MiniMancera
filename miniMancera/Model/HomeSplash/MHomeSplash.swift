import Foundation

class MHomeSplash
{
    let items:[MHomeSplashProtocol]
    
    init(model:MHomeOptionsProtocol)
    {
        let itemDescr:MHomeSplashDescr = MHomeSplashDescr(model:model)
        
        items = [
            itemDescr]
    }
}
