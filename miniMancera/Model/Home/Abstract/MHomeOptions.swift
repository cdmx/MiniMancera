import UIKit

class MHomeOptions
{
    private(set) weak var dataOption:DOption?
    private(set) var title:String?
    private(set) var descr:String?
    private(set) var thumbnail:UIImage?
    private(set) var splashImage:UIImage?
    private(set) var scoreIcon:UIImage?
    
    required init(dataOption:DOption)
    {
        self.dataOption = dataOption
    }
    
    //MARK: public
    
    func gameController() -> UIViewController?
    {
        return nil
    }
    
    //MARK: final
    
    final func gameControllerWith<T:MGame>(type:ControllerGame<T>.Type) -> ControllerGame<T>?
    {
        guard
        
            let dataOption:DOption = self.dataOption
        
        else
        {
            return nil
        }
        
        let controller:ControllerGame<T> = type.init(dataOption:dataOption)
        
        return controller
    }
    
    final func available() -> Bool
    {
        guard
            
            let dataOption:DOptionPurchase = dataOption as? DOptionPurchase
            
        else
        {
            return true
        }
        
        let purchased:Bool = dataOption.purchased
        
//        return purchased
        return true
    }
}
