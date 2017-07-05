import UIKit

class MOptionWhistlesVsZombiesBoardItemBlue:MOptionWhistlesVsZombiesBoardItemProtocol
{
    private let modelScore:MOptionWhistlesVsZombiesBoardScore
    private let kPrice:Int = 10
    
    init()
    {
        let whistle:MOptionWhistlesVsZombiesWhistleBlue = MOptionWhistlesVsZombiesWhistleBlue()
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
}
