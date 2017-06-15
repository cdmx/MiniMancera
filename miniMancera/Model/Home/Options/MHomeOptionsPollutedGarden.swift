import UIKit

class MHomeOptionsPollutedGarden:MHomeOptionsProtocol
{   
    var available:Bool
    {
        get
        {
            return false
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
    
    required init()
    {
    }
    
    func gameController() -> UIViewController
    {
        let controller:COptionReformaCrossing = COptionReformaCrossing()
        
        return controller
    }
}
