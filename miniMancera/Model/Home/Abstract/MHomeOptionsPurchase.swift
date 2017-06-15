import UIKit

class MHomeOptionsPurchase:MHomeOptionsProtocol
{
    private(set) weak var dataOption:DOptionPurchase?
    
    var available:Bool
    {
        get
        {
            guard
            
                let purchased:Bool = dataOption?.purchased
            
            else
            {
                return false
            }
            
            return purchased
        }
    }
    
    var title:String?
    {
        get
        {
            return nil
        }
    }
    
    var descr:String?
    {
        get
        {
            return nil
        }
    }
    
    var thumbnail:UIImage?
    {
        get
        {
            return nil
        }
    }
    
    var splashImage:UIImage?
    {
        get
        {
            return nil
        }
    }
    
    required init(dataOption:DOption)
    {
        self.dataOption = dataOption as? DOptionPurchase
    }
    
    func selected() -> UIViewController?
    {
        return nil
    }
}
