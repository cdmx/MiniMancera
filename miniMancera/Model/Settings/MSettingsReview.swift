import UIKit

class MSettingsReview:MSettingsProtocol
{
    private let kCellHeight:CGFloat = 60
    
    var reusableIdentifier:String
    {
        get
        {
            return VSettingsCellReview.reusableIdentifier
        }
    }
    
    var cellHeight:CGFloat
    {
        get
        {
            return kCellHeight
        }
    }
}
