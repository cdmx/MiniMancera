import UIKit

class MOptionWhistlesVsZombiesBoardItemOrange:MOptionWhistlesVsZombiesBoardItemProtocol
{
    private let modelScore:MOptionWhistlesVsZombiesBoardScore
    private let kPrice:Int = 12
    
    init()
    {
        let whistle:MOptionWhistlesVsZombiesWhistleOrange = MOptionWhistlesVsZombiesWhistleOrange()
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
            return #imageLiteral(resourceName: "assetWhistlesVsZombiesWhistleOrangeBoard")
        }
    }
    
    var title:String
    {
        get
        {
            return String.localizedWhistlesVsZombies(
                key:"MOptionWhistlesVsZombiesBoardItemOrange_title")
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
