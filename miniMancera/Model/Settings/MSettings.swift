import Foundation

class MSettings
{
    let items:[MSettingsProtocol]
    
    init()
    {
        let itemSounds:MSettingsSounds = MSettingsSounds()
        let itemShare:MSettingsShare = MSettingsShare()
        let itemReview:MSettingsReview = MSettingsReview()
        
        items = [
            itemSounds,
            itemShare,
            itemReview]
    }
}
