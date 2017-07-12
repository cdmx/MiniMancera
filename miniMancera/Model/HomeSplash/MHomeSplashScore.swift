import UIKit

class MHomeSplashScore:MHomeSplashProtocol
{
    let icon:UIImage?
    private(set) weak var dataOption:DOption?
    private(set) var reusableIdentifier:String
    private let kCellHeight:CGFloat = 70
    
    init(model:MHomeOptions)
    {
        icon = model.scoreIcon
        reusableIdentifier = VHomeSplashCellScore.reusableIdentifier
        self.dataOption = model.dataOption
    }
    
    //MARK: splash protocol
    
    func cellHeightFor(width:CGFloat) -> CGFloat
    {
        return kCellHeight
    }
}
