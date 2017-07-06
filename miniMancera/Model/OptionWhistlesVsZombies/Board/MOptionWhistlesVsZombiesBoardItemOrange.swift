import UIKit

class MOptionWhistlesVsZombiesBoardItemOrange:MOptionWhistlesVsZombiesBoardItemProtocol
{
    private(set) weak var whistleType:MOptionWhistlesVsZombiesWhistleTypeProtocol!
    private(set) var score:MOptionWhistlesVsZombiesBoardScore
    private(set) var image:UIImage
    private(set) var available:Bool
    private(set) var title:String
    private(set) var price:Int
    private let kPrice:Int = 12
    
    required init(
        whistleType:MOptionWhistlesVsZombiesWhistleTypeProtocol,
        playerCoins:Int)
    {
        self.whistleType = whistleType
        score = MOptionWhistlesVsZombiesBoardScore(
            whistle:whistleType.whistle)
        image = #imageLiteral(resourceName: "assetWhistlesVsZombiesWhistleOrangeBoard")
        title = String.localizedWhistlesVsZombies(
            key:"MOptionWhistlesVsZombiesBoardItemOrange_title")
        available = playerCoins >= kPrice
        price = kPrice
    }
}
