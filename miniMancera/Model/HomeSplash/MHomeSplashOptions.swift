import UIKit

class MHomeSplashOptions:MHomeSplashProtocol
{
    private let kCellHeight:CGFloat = 100
    
    //MARK: splash protocol
    
    var reusableIdentifier:String
    {
        get
        {
            return VHomeSplashCellOptions.reusableIdentifier
        }
    }
    
    func cellHeightFor(width:CGFloat) -> CGFloat
    {
        return kCellHeight
    }
}
