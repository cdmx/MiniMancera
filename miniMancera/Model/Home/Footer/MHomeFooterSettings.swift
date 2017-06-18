import UIKit

class MHomeFooterSettings:MHomeFooterProtocol
{
    var title:String
    {
        get
        {
            return String.localized(key:"MHomeFooterSettings_title")
        }
    }
    
    var image:UIImage
    {
        get
        {
            return #imageLiteral(resourceName: "assetGenericSettings")
        }
    }
    
    func selected(controller:CHome)
    {
        controller.footerSettings()
    }
}
