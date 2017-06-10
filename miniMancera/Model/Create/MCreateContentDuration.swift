import UIKit

class MCreateContentDuration:MCreateContentProtocol
{
    private let kCellHeight:CGFloat = 80
    
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
            return VCreateCellDuration.reusableIdentifier
        }
    }
}
