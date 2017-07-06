import UIKit

class MOptionWhistlesVsZombiesBoardItemPink:MOptionWhistlesVsZombiesBoardItemProtocol
{
    private(set) weak var whistleType:MOptionWhistlesVsZombiesWhistleTypeProtocol!
    private(set) var score:MOptionWhistlesVsZombiesBoardScore
    private(set) var image:UIImage
    private(set) var available:Bool
    private(set) var title:String
    private let kPrice:Int = 7
    
    required init(
        whistleType:MOptionWhistlesVsZombiesWhistleTypeProtocol,
        playerCoins:Int)
    {
        self.whistleType = whistleType
        score = MOptionWhistlesVsZombiesBoardScore(
            whistle:whistleType.whistle)
        image = #imageLiteral(resourceName: "assetWhistlesVsZombiesWhistlePinkBoard")
        title = String.localizedWhistlesVsZombies(
            key:"MOptionWhistlesVsZombiesBoardItemPink_title")
        available = playerCoins >= kPrice
    }
    
    var price:Int
    {
        get
        {
            return kPrice
        }
    }
}
