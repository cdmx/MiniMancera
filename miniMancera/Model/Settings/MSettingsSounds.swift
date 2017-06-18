import UIKit

class MSettingsSounds:MSettingsProtocol
{
    private let kCellHeight:CGFloat = 80
    
    var reusableIdentifier:String
    {
        get
        {
            return VSettingsCellSounds.reusableIdentifier
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
