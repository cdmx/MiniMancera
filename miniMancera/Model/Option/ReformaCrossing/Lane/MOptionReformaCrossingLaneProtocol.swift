import UIKit

protocol MOptionReformaCrossingLaneProtocol
{
    var scaleHorizontal:CGFloat { get }
    var direction:CGFloat { get }
    var posibleFoes:[MOptionReformaCrossingFoe.Id] { get }
}
