import UIKit

class MHomeFooterBoards:MHomeFooterProtocol
{
    var title:String
    {
        get
        {
            return NSLocalizedString("MHomeFooterBoards_title", comment:"")
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
    }
}
