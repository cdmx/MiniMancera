import UIKit

class MCreateContentCard:MCreateContentProtocol
{
    private let kCellHeight:CGFloat = 250
    
    var cellHeight:CGFloat
    {
        get
        {
            return kCellHeight
        }
    }
    
    var reusableIdentifier:String
    {
        get
        {
            return VCreateCellCard.reusableIdentifier
        }
    }
}
