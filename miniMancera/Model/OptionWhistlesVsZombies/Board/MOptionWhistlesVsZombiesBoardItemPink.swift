import UIKit

class MOptionWhistlesVsZombiesBoardItemPink:MOptionWhistlesVsZombiesBoardItemProtocol
{
    private let modelScore:MOptionWhistlesVsZombiesBoardScore
    private let enoughCoins:Bool
    private let kPrice:Int = 7
    
    init(coins:Int)
    {
        let whistle:MOptionWhistlesVsZombiesWhistlePink = MOptionWhistlesVsZombiesWhistlePink()
        modelScore = MOptionWhistlesVsZombiesBoardScore(
            whistle:whistle)
        
        enoughCoins = coins > kPrice
    }
    
    var score:MOptionWhistlesVsZombiesBoardScore
    {
        get
        {
            return modelScore
        }
    }
    
    var image:UIImage
    {
        get
        {
            return #imageLiteral(resourceName: "assetWhistlesVsZombiesWhistlePinkBoard")
        }
    }
    
    var title:String
    {
        get
        {
            return String.localizedWhistlesVsZombies(
                key:"MOptionWhistlesVsZombiesBoardItemPink_title")
        }
    }
    
    var price:Int
    {
        get
        {
            return kPrice
        }
    }
    
    var available:Bool
    {
        get
        {
            return enoughCoins
        }
    }
}
