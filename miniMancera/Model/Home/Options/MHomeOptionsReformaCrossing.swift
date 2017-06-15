import UIKit

class MHomeOptionsReformaCrossing:MHomeOptionsFree
{
    override var title:String?
    {
        get
        {
            return NSLocalizedString("MHomeOptionsReformaCrossing_title", comment:"")
        }
    }
    
    override var thumbnail:UIImage?
    {
        get
        {
            return UIImage()
        }
    }
    
    override func selected() -> UIViewController?
    {
        let controller:COptionReformaCrossing = COptionReformaCrossing()
        
        return controller
    }
}
