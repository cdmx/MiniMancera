import UIKit

class MHomeFooterSettings:MHomeFooterProtocol
{
    var title:String
    {
        get
        {
            return NSLocalizedString("MHomeFooterSettings_title", comment:"")
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
    }
}
