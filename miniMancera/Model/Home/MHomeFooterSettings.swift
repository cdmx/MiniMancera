import UIKit

class MHomeFooterSettings:MHomeFooterProtocol
{
    var title:String
    {
        get
        {
            return NSLocalizedString("", comment:"")
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
