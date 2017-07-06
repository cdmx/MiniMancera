import UIKit

class MOptionWhistlesVsZombiesBoardItemBlue:MOptionWhistlesVsZombiesBoardItemProtocol
{
    private let modelScore:MOptionWhistlesVsZombiesBoardScore
    private let enoughCoins:Bool
    private let kPrice:Int = 10
    
    init(coins:Int)
    {
        let whistle:MOptionWhistlesVsZombiesWhistleBlue = MOptionWhistlesVsZombiesWhistleBlue()
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
            return #imageLiteral(resourceName: "assetWhistlesVsZombiesWhistleBlueBoard")
        }
    }
    
    var title:String
    {
        get
        {
            return String.localizedWhistlesVsZombies(
                key:"MOptionWhistlesVsZombiesBoardItemBlue_title")
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
