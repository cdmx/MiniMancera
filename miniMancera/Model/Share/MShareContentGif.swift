import UIKit

class MShareContentGif:MShareContentProtocol
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
            return VShareCellGif.reusableIdentifier
        }
    }
}
