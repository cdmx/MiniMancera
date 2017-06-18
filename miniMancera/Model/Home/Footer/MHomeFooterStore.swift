import UIKit

class MHomeFooterStore:MHomeFooterProtocol
{
    var title:String
    {
        get
        {
            return String.localized(key:"MHomeFooterStore_title")
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
        controller.footerStore()
    }
}
