import Foundation

class MOptionWhistlesVsZombiesBoard
{
    let items:[MOptionWhistlesVsZombiesBoardItemProtocol]
    
    private class func factoryItemsWithModel(model:MOptionWhistlesVsZombies) -> [MOptionWhistlesVsZombiesBoardItemProtocol]
    {
        let coins:Int = model.coins
        var items:[MOptionWhistlesVsZombiesBoardItemProtocol] = []
        
        for whistle:MOptionWhistlesVsZombiesWhistleTypeProtocol in model.whistle.types
        {
            let itemType:MOptionWhistlesVsZombiesBoardItemProtocol.Type = whistle.boardItemType
            let item:MOptionWhistlesVsZombiesBoardItemProtocol = itemType.init(
                whistleType:whistle,
                playerCoins:coins)
            items.append(item)
        }
        
        return items
    }
    
    init(model:MOptionWhistlesVsZombies)
    {
        items = MOptionWhistlesVsZombiesBoard.factoryItemsWithModel(
            model:model)
    }
}
