import UIKit

class MShareContentPng:MShareContentProtocol
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
            return VShareCellPng.reusableIdentifier
        }
    }
}
