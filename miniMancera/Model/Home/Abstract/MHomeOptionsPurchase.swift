import UIKit

class MHomeOptionsPurchase
{
    private(set) weak var dataOption:DOption?
    
    var available:Bool
    {
        get
        {
            guard
            
                let dataOption:DOptionPurchase = self.dataOption as? DOptionPurchase
            
            else
            {
                return false
            }
            
            return dataOption.purchased
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
        self.dataOption = dataOption
    }
    
    func selected() -> UIViewController?
    {
        return nil
    }
}
