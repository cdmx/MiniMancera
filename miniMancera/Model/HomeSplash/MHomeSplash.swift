import Foundation

class MHomeSplash
{
    let items:[MHomeSplashProtocol]
    private(set) weak var modelOption:MHomeOptions!
    
    init(modelOption:MHomeOptions)
    {
        self.modelOption = modelOption
        let itemOptions:MHomeSplashOptions = MHomeSplashOptions()
        let itemDescr:MHomeSplashDescr = MHomeSplashDescr(model:modelOption)
        
        items = [
            itemOptions,
            itemDescr]
    }
}
