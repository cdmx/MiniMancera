import UIKit

class MHomeSplashDescr:MHomeSplashProtocol
{
    let title:String?
    let descr:String?
    
    init(model:MHomeOptionsProtocol)
    {
        title = model.title
        descr = model.descr
    }
    
    //MARK: splash protocol
    
    var reusableIdentifier:String
    {
        get
        {
            return VHomeSplashCellDescr.reusableIdentifier
        }
    }
    
    func cellHeightFor(width:CGFloat) -> CGFloat
    {
        return 0
    }
}
