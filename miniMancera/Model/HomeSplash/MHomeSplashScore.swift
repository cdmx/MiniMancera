import UIKit

class MHomeSplashScore:MHomeSplashProtocol
{
    let icon:UIImage?
    private(set) weak var dataOption:DOption?
    private let kCellHeight:CGFloat = 70
    
    init(model:MHomeOptions)
    {
        icon = model.scoreIcon
        self.dataOption = model.dataOption
    }
    
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
