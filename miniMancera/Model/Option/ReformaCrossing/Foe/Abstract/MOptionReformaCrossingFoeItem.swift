import UIKit

class MOptionReformaCrossingFoeItem
{
    let created:TimeInterval
    weak var view:VOptionReformaCrossingFoe!
    private(set) weak var lane:MOptionReformaCrossingLane!
    private(set) weak var texture:MGameTexture!
    private(set) var minSpeed:CGFloat
    private(set) var randomMaxSpeed:UInt32
    private var strategy:MOptionReformaCrossingFoeStrategy?
    private var trip:MOptionReformaCrossingFoeItemTrip?
    private let kPauseDuration:TimeInterval = 1
    
    required init?(
        model:MOptionReformaCrossing,
        lane:MOptionReformaCrossingLane)
    {
        return nil
    }
    
    init(lane:MOptionReformaCrossingLane, texture:MGameTexture)
    {
        self.texture = texture
        self.lane = lane
        created = Date().timeIntervalSince1970
        minSpeed = 0
        randomMaxSpeed = 0
        trip = lane.foeTrip(foe:self)
    }
    
    //MARK: public
    
    func randomSpeed() -> CGFloat
    {
        print("min \(minSpeed) max \(randomMaxSpeed)")
        let random:CGFloat = CGFloat(arc4random_uniform(randomMaxSpeed))
        let totalSpeed:CGFloat = minSpeed + random
        
        return totalSpeed
    }
    
    func update(elapsedTime:TimeInterval)
    {
        
    }
}
