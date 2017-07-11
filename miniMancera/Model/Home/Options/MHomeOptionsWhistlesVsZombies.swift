import UIKit

class MHomeOptionsWhistlesVsZombies:MHomeOptions
{
    override var title:String?
    {
        get
        {
            return String.localizedWhistlesVsZombies(
                key:"MHomeOptionsWhistlesVsZombies_title")
        }
    }
    
    override var descr:String?
    {
        get
        {
            return String.localizedWhistlesVsZombies(
                key:"MHomeOptionsWhistlesVsZombies_descr")
        }
    }
    
    override var thumbnail:UIImage?
    {
        get
        {
            return #imageLiteral(resourceName: "assetGenericWhistlesVsZombiesThumbnail")
        }
    }
    
    override var splashImage:UIImage?
    {
        get
        {
            return #imageLiteral(resourceName: "assetGenericWhistlesVsZombiesSplash")
        }
    }
    
    override var scoreIcon:UIImage?
    {
        get
        {
            return #imageLiteral(resourceName: "assetGenericWhistlesVsZombiesScore")
        }
    }
    
    override func gameController() -> UIViewController?
    {
        let controller:UIViewController? = gameControllerWith(type:COptionWhistlesVsZombies.self)
        
        return controller
    }
}
