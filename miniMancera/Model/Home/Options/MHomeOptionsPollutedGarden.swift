import UIKit

class MHomeOptionsPollutedGarden:MHomeOptions
{
    override var title:String?
    {
        get
        {
            return String.localizedPollutedGarden(key:"MHomeOptionsPollutedGarden_title")
        }
    }
    
    override var descr:String?
    {
        get
        {
            return String.localizedPollutedGarden(key:"MHomeOptionsPollutedGarden_descr")
        }
    }
    
    override var thumbnail:UIImage?
    {
        get
        {
            return #imageLiteral(resourceName: "assetGenericPollutedGardenThumbnail")
        }
    }
    
    override var splashImage:UIImage?
    {
        get
        {
            return #imageLiteral(resourceName: "assetGenericPollutedGardenSplash")
        }
    }
    
    override var scoreIcon:UIImage?
    {
        get
        {
            return #imageLiteral(resourceName: "assetGenericPollutedGardenScore")
        }
    }
    
    override func gameController() -> UIViewController?
    {
        let controller:UIViewController? = gameControllerWith(type:COptionPollutedGarden.self)
        
        return controller
    }
}
