import UIKit

extension MOptionWhistlesVsZombiesGround
{
    class func factoryLanes(area:MOptionWhistlesVsZombiesArea) -> [MOptionWhistlesVsZombiesGroundLane]
    {
        var lanes:[MOptionWhistlesVsZombiesGroundLane] = []
        
        for positionY:CGFloat in area.lane
        {
            let lane:MOptionWhistlesVsZombiesGroundLane = MOptionWhistlesVsZombiesGroundLane(
                positionY:positionY)
            lanes.append(lane)
        }
        
        return lanes
    }
}
