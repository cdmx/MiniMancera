import UIKit

class MHomeSplashDescr:MHomeSplashProtocol
{
    private weak var model:MHomeOptionsProtocol?
    
    init(model:MHomeOptionsProtocol)
    {
        self.model = model
    }
    
    //MARK: splash protocol
    
    var reusableIdentifier:String
    {
        get
        {
            return ""
        }
    }
    
    func cellHeightFor(width:CGFloat) -> CGFloat
    {
        return 0
    }
}
