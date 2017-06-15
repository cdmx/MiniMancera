import UIKit

class MHomeOptionsReformaCrossing:MHomeOptionsFree
{
    override var title:String?
    {
        get
        {
            return String.localizedReformaCrossing(key:"MHomeOptionsReformaCrossing_title")
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
