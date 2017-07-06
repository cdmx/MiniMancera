import UIKit

protocol MOptionWhistlesVsZombiesBoardItemProtocol:class
{
    init(
        whistleType:MOptionWhistlesVsZombiesWhistleTypeProtocol,
        playerCoins:Int)

    weak var whistleType:MOptionWhistlesVsZombiesWhistleTypeProtocol! { get }
    var score:MOptionWhistlesVsZombiesBoardScore { get }
    var image:UIImage { get }
    var title:String { get }
    var price:Int { get }
    var available:Bool { get }
}
