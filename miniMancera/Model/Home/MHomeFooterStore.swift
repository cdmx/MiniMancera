import UIKit

class MHomeFooterStore:MHomeFooterProtocol
{
    var title:String
    {
        get
        {
            return NSLocalizedString("MHomeFooterStore_title", comment:"")
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
