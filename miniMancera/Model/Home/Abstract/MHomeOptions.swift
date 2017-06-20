import UIKit

class MHomeOptions
{
    let available:Bool
    private(set) weak var dataOption:DOption?
    private(set) var title:String?
    private(set) var descr:String?
    private(set) var thumbnail:UIImage?
    private(set) var splashImage:UIImage?
    
    required init(dataOption:DOption)
    {
        self.dataOption = dataOption
        
        guard
            
            let dataOption:DOptionPurchase = dataOption as? DOptionPurchase
            
        else
        {
            available = true
            
            return
        }
        
        available = dataOption.purchased
    }
    
    //MARK: public
    
    func gameController() -> UIViewController?
    {
        return nil
    }
    
    final func gameControllerForType<T:MOptionProtocol>(controller:ControllerGame<T>.Type) -> ControllerGame<T>?
    {
        guard
            
            let dataOption:DOption = self.dataOption
        
        else
        {
            return nil
        }
        
        let controller:ControllerGame<T> = ControllerGame(dataOption:dataOption)
        
        return controller
    }
}
