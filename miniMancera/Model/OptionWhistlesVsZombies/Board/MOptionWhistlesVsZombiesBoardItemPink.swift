import UIKit

class MOptionWhistlesVsZombiesBoardItemPink:MOptionWhistlesVsZombiesBoardItemProtocol
{
    private let modelScore:MOptionWhistlesVsZombiesBoardScore
    private let kPrice:Int = 5
    
    init()
    {
        let whistle:MOptionWhistlesVsZombiesWhistlePink = MOptionWhistlesVsZombiesWhistlePink()
        modelScore = MOptionWhistlesVsZombiesBoardScore(
            whistle:whistle)
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
}
