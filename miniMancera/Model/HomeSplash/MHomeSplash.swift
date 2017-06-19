import Foundation

class MHomeSplash
{
    let items:[MHomeSplashProtocol]
    
    init(model:MHomeOptions)
    {
        let itemDescr:MHomeSplashDescr = MHomeSplashDescr(model:model)
        
        items = [
            itemDescr]
    }
}
