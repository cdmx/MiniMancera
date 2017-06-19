import UIKit

class MHomeOptionsReformaCrossing:MHomeOptions
{
    override var title:String?
    {
        get
        {
            return String.localizedReformaCrossing(key:"MHomeOptionsReformaCrossing_title")
        }
    }
    
    override var descr:String?
    {
        get
        {
            return String.localizedReformaCrossing(key:"MHomeOptionsReformaCrossing_descr")
        }
    }
    
    override var thumbnail:UIImage?
    {
        get
        {
            return #imageLiteral(resourceName: "assetGenericReformaCrossingThumbnail")
        }
    }
    
    override var splashImage:UIImage?
    {
        get
        {
            return #imageLiteral(resourceName: "assetGenericReformaCrossingSplash")
        }
    }
}
