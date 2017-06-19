import UIKit

class MHomeOptions
{
    typealias OptionProtocol = MOptionProtocol
    var title:String?
    var descr:String?
    var thumbnail:UIImage?
    var splashImage:UIImage?
    var gameController:ControllerGame.Type?
    private(set) weak var dataOption:DOption?
    
    init(dataOption:DOption)
    {
        self.dataOption = dataOption
    }
    
    //MARK: final
    
    final func available() -> Bool
    {
        guard
        
            let dataOption:DOptionPurchase = self.dataOption as? DOptionPurchase
        
        else
        {
            return true
        }
        
        return dataOption.purchased
    }
}
