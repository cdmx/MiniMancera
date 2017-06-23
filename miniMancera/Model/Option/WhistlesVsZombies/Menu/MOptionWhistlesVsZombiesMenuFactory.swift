import UIKit

extension MOptionWhistlesVsZombiesMenu
{
    private static let kPositionX:CGFloat = 0
    private static let kInitialPositionY:CGFloat = 100
    private static let kDeltaYPosition:CGFloat = 60
    
    class func factoryItems(sceneSize:CGSize) -> [MOptionWhistlesVsZombiesMenuItem]
    {
        let sceneHeight:CGFloat = sceneSize.height
        let sceneHeight_2:CGFloat = sceneHeight / 2.0
        var whistlePositionY:CGFloat = sceneHeight_2 - kInitialPositionY
        
        let itemPink:MOptionWhistlesVsZombiesMenuItemPink = MOptionWhistlesVsZombiesMenuItemPink(
            positionX:kPositionX,
            positionY:whistlePositionY)
        
        let items:[MOptionWhistlesVsZombiesMenuItem] = [
            itemPink]
        
        return items
    }
}
