import UIKit

class MHomeOptionsFree:MHomeOptionsProtocol
{
    private(set) weak var dataOption:DOptionFree?
    
    var available:Bool
    {
        get
        {
            if dataOption == nil
            {
                return false
            }
            
            return true
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
        self.dataOption = dataOption as? DOptionFree
    }
    
    func selected() -> UIViewController?
    {
        return nil
    }
}
