import UIKit

protocol MOptionWhistlesVsZombiesBoardItemProtocol:class
{
    var score:MOptionWhistlesVsZombiesBoardScore { get }
    var image:UIImage { get }
    var title:String { get }
    var price:Int { get }
    var available:Bool { get }
}
