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
}
