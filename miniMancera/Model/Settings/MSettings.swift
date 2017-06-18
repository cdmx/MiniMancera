import Foundation

class MSettings
{
    let items:[MSettingsProtocol]
    
    init()
    {
        let itemShare:MSettingsShare = MSettingsShare()
        let itemReview:MSettingsReview = MSettingsReview()
        
        items = [
            itemShare,
            itemReview]
    }
}
