import Foundation

class MOptionWhistlesVsZombiesGround
{
    private let lanes:[MOptionWhistlesVsZombiesGroundLane]
    
    init(area:MOptionWhistlesVsZombiesArea)
    {
        lanes = MOptionWhistlesVsZombiesGround.factoryLanes(area:area)
    }
}
