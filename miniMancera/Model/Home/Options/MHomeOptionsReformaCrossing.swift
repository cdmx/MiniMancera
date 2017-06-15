import UIKit

class MHomeOptionsReformaCrossing:MHomeOptionsProtocol
{
    private weak var dataOption:DOption?
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
    
    required init(dataOption:DOption)
    {
        self.dataOption = dataOption
    }
    
    func gameController() -> UIViewController
    {
        let controller:COptionReformaCrossing = COptionReformaCrossing()
        
        return controller
    }
}
