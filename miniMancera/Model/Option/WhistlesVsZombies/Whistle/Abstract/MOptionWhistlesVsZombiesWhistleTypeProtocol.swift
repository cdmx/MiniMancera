import UIKit

protocol MOptionWhistlesVsZombiesWhistleTypeProtocol:class
{
    var whistle:MOptionWhistlesVsZombiesWhistleProtocol { get }
    var boardItemType:MOptionWhistlesVsZombiesBoardItemProtocol.Type { get }
    var texture:MGameTexture { get }
    var colour:UIColor { get }
    var barrelLength:CGFloat { get }
}
