import UIKit

class MSettingsShare:MSettingsProtocol
{
    private let kCellHeight:CGFloat = 60
    
    var reusableIdentifier:String
    {
        get
        {
            return VSettingsCellShare.reusableIdentifier
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
