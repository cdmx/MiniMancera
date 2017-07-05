import UIKit

class MOptionWhistlesVsZombiesBoardScore
{
    let items:[MOptionWhistlesVsZombiesBoardScoreItem]
    private static let kSpeedDivider:TimeInterval = 10
    private static let kPowerDivider:CGFloat = 10
    
    init(whistle:MOptionWhistlesVsZombiesWhistleProtocol)
    {
        let itemSpeed:MOptionWhistlesVsZombiesBoardScoreItem = MOptionWhistlesVsZombiesBoardScore.factoryItemSpeed(
            whistle:whistle)
        let itemPower:MOptionWhistlesVsZombiesBoardScoreItem = MOptionWhistlesVsZombiesBoardScore.factoryItemPower(
            whistle:whistle)
        
        items = [
            itemSpeed,
            itemPower]
    }
    
    //MARK: private
    
    private class func factoryItemSpeed(whistle:MOptionWhistlesVsZombiesWhistleProtocol) -> MOptionWhistlesVsZombiesBoardScoreItem
    {
        let title:String = String.localizedWhistlesVsZombies(
            key:"MOptionWhistlesVsZombiesBoardScore_titleSpeed")
        let speed:TimeInterval = whistle.speed / kSpeedDivider
        let speedAmount:Int = Int(round(speed))
        
        let item:MOptionWhistlesVsZombiesBoardScoreItem = MOptionWhistlesVsZombiesBoardScoreItem(
            title:title,
            amount:speedAmount)
        
        return item
    }
    
    private class func factoryItemPower(whistle:MOptionWhistlesVsZombiesWhistleProtocol) -> MOptionWhistlesVsZombiesBoardScoreItem
    {
        let title:String = String.localizedWhistlesVsZombies(
            key:"MOptionWhistlesVsZombiesBoardScore_titlePower")
        let power:CGFloat = whistle.power / kPowerDivider
        let powerAmount:Int = Int(round(power))
        
        let item:MOptionWhistlesVsZombiesBoardScoreItem = MOptionWhistlesVsZombiesBoardScoreItem(
            title:title,
            amount:powerAmount)
        
        return item
    }
}
