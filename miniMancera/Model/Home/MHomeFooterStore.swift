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
            return UIImage()
        }
    }
    
    func selected(controller:CHome)
    {
    }
}
