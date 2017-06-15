import UIKit

class MHomeFooterBoards:MHomeFooterProtocol
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
            return #imageLiteral(resourceName: "assetGenericBoards")
        }
    }
    
    func selected(controller:CHome)
    {
    }
}
