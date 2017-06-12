import UIKit

protocol MOptionReformaCrossingLaneProtocol:class
{
    var scaleHorizontal:CGFloat { get }
    var direction:CGFloat { get }
    func foeInitialPoint(foe:MOptionReformaCrossingFoe, sceneSize:CGSize) -> CGPoint
    func foeEndingPoint(foe:MOptionReformaCrossingFoe, sceneSize:CGSize) -> CGPoint
}
