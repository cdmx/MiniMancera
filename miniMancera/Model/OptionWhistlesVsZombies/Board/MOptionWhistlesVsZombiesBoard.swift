import Foundation

class MOptionWhistlesVsZombiesBoard
{
    let items:[MOptionWhistlesVsZombiesBoardItemProtocol]
    
    init(coins:Int)
    {
        let itemPink:MOptionWhistlesVsZombiesBoardItemPink = MOptionWhistlesVsZombiesBoardItemPink(
            coins:coins)
        let itemBlue:MOptionWhistlesVsZombiesBoardItemBlue = MOptionWhistlesVsZombiesBoardItemBlue(
            coins:coins)
        let itemOrange:MOptionWhistlesVsZombiesBoardItemOrange = MOptionWhistlesVsZombiesBoardItemOrange(
            coins:coins)
        
        items = [
            itemPink,
            itemBlue,
            itemOrange]
    }
}
