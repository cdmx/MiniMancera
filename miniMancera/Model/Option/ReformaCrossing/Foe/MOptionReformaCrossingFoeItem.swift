import UIKit

class MOptionReformaCrossingFoeItem
{
    let created:TimeInterval
    weak var lane:MOptionReformaCrossingLane!
    private weak var controller:COptionReformaCrossing!
    private var strategy:MOptionReformaCrossingFoeStrategy?
    private(set) var texture:MGameTexture?
    private(set) var minSpeed:CGFloat
    private(set) var randomMaxSpeed:UInt32
    private let kPauseDuration:TimeInterval = 1
    
    init(controller:COptionReformaCrossing)
    {
        self.controller = controller
        minSpeed = 0
        randomMaxSpeed = 0
        created = Date().timeIntervalSince1970
    }
}
