import UIKit

class MHomeOptions
{
    private(set) weak var dataOption:DOption?
    private(set) var gameControllerType:UIViewController.Type?
    private(set) var title:String?
    private(set) var descr:String?
    private(set) var thumbnail:UIImage?
    private(set) var splashImage:UIImage?
    private(set) var scoreIcon:UIImage?
    
    required init(dataOption:DOption)
    {
        self.dataOption = dataOption
    }
    
    //MARK: final
    
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
