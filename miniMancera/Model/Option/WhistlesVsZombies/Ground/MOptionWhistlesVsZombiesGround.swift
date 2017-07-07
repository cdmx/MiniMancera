import Foundation

class MOptionWhistlesVsZombiesGround
{
    private let lanes:[MOptionWhistlesVsZombiesGroundLane]
    private let count:UInt32
    
    init(area:MOptionWhistlesVsZombiesArea)
    {
        lanes = MOptionWhistlesVsZombiesGround.factoryLanes(area:area)
        count = UInt32(lanes.count)
    }
    
    //MARK: public
    
    func randomLane() -> MOptionWhistlesVsZombiesGroundLane
    {
        let random:UInt32 = arc4random_uniform(count)
        let randomInt:Int = Int(random)
        let lane:MOptionWhistlesVsZombiesGroundLane = lanes[randomInt]
        
        return lane
    }
}
