import UIKit

class MHomeOptionsWhistlesVsZombies:MHomeOptions
{
    override var title:String?
    {
        get
        {
            return String.localizedWhistlesVsZombies(key:"MHomeOptionsWhistlesVsZombies_title")
        }
    }
    
    override func gameController() -> UIViewController?
    {
        let controller:UIViewController? = gameControllerWith(type:COptionWhistlesVsZombies.self)
        
        return controller
    }
}
