import UIKit

class MHomeFooterStore:MHomeFooterProtocol
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
            return #imageLiteral(resourceName: "assetGenericStore")
        }
    }
    
    func selected(controller:CHome)
    {
    }
}
