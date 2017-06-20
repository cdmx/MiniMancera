import UIKit

class MHomeSplashScore:MHomeSplashProtocol
{
    let score:Int
    private let kCellHeight:CGFloat = 200
    
    init(model:MHomeOptions)
    {
        guard
        
            let score:Int32 = model.dataOption?.maxScore
        
        else
        {
            self.score = 0
            
            return
        }
        
        self.score = Int(score)
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
