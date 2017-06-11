import UIKit

protocol MOptionReformaCrossingLaneProtocol
{
    var scaleHorizontal:CGFloat { get }
    func foeInitialPoint(foe:MOptionReformaCrossingFoe, sceneSize:CGSize) -> CGPoint
    func foeEndingPoint(foe:MOptionReformaCrossingFoe, sceneSize:CGSize) -> CGPoint
}
