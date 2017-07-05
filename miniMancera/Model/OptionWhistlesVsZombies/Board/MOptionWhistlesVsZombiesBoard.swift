import Foundation

class MOptionWhistlesVsZombiesBoard
{
    let items:[MOptionWhistlesVsZombiesBoardItemProtocol]
    
    init()
    {
        let itemPink:MOptionWhistlesVsZombiesBoardItemPink = MOptionWhistlesVsZombiesBoardItemPink()
        let itemBlue:MOptionWhistlesVsZombiesBoardItemBlue = MOptionWhistlesVsZombiesBoardItemBlue()
        let itemOrange:MOptionWhistlesVsZombiesBoardItemOrange = MOptionWhistlesVsZombiesBoardItemOrange()
        
        items = [
            itemPink,
            itemBlue,
            itemOrange]
    }
}
