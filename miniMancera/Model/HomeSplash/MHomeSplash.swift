import Foundation

class MHomeSplash
{
    let items:[MHomeSplashProtocol]
    private(set) weak var modelOption:MHomeOptions!
    
    init(modelOption:MHomeOptions)
    {
        self.modelOption = modelOption
        let itemDescr:MHomeSplashDescr = MHomeSplashDescr(model:modelOption)
        
        items = [
            itemDescr]
    }
}
