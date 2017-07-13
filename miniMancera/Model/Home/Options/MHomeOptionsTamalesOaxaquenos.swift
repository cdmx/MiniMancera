import UIKit

class MHomeOptionsTamalesOaxaquenos:MHomeOptions
{
    override var title:String?
    {
        get
        {
            return String.localizedTamalesOaxaquenos(
                key:"MHomeOptionsTamalesOaxaquenos_title")
        }
    }
    
    override func gameController() -> UIViewController?
    {
        let controller:UIViewController? = gameControllerWith(type:COptionTamalesOaxaquenos.self)
        
        return controller
    }
}
