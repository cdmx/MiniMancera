import Foundation

class MOptionWhistlesVsZombiesZombieItem:MGameUpdate<MOptionWhistlesVsZombies>
{
    private(set) weak var type:MOptionWhistlesVsZombiesZombieItemProtocol!
    
    init(
        type:MOptionWhistlesVsZombiesZombieItemProtocol,
        lane:MOptionWhistlesVsZombiesGroundLane)
    {
        self.type = type
    }
}
