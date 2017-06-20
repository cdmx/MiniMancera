import UIKit

class MHomeSplashScore:MHomeSplashProtocol
{
    let score:Int
    let suffix:String
    let icon:UIImage?
    private let kCellHeight:CGFloat = 200
    
    init(model:MHomeOptions)
    {
        icon = model.scoreIcon
        
        if let score:Int32 = model.dataOption?.maxScore
        {
            self.score = Int(score)
        }
        else
        {
            score = 0
        }
        
        if let suffix:String = model.scoreSuffix
        {
            self.suffix = suffix
        }
        else
        {
            suffix = ""
        }
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
