import UIKit

class MHomeOptionsReformaCrossing:MHomeOptionsProtocol
{
    private let kAvailable:Bool = true
    
    var available:Bool
    {
        get
        {
            return kAvailable
        }
    }
    
    var title:String
    {
        get
        {
            return NSLocalizedString("MHomeOptionsReformaCrossing_title", comment:"")
        }
    }
    
    var thumbnail:UIImage
    {
        get
        {
            return UIImage()
        }
    }
    
    func gameController() -> ControllerGame
    {
        let controller:COptionReformaCrossing = COptionReformaCrossing()
        
        return controller
    }
}
