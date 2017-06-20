import UIKit

class MHomeSplashScore:MHomeSplashProtocol
{
    private let kCellHeight:CGFloat = 200
    
    //MARK: splash protocol
    
    var reusableIdentifier:String
    {
        get
        {
            return VHomeSplashCellScore.reusableIdentifier
        }
    }
    
    func cellHeightFor(width:CGFloat) -> CGFloat
    {
        return kCellHeight
    }
}
