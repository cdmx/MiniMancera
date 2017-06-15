import UIKit

class MHomeFooterBoards:MHomeFooterProtocol
{
    var title:String
    {
        get
        {
            return String.localized(key:"MHomeFooterBoards_title")
        }
    }
    
    var image:UIImage
    {
        get
        {
            return #imageLiteral(resourceName: "assetGenericBoards")
        }
    }
    
    func selected(controller:CHome)
    {
        controller.footerBoards()
    }
}
