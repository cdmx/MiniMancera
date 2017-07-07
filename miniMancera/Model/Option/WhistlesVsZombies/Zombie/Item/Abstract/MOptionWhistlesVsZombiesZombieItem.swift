import Foundation

class MOptionWhistlesVsZombiesZombieItem:MGameUpdate<MOptionWhistlesVsZombies>
{
    weak var view:VOptionWhistlesVsZombiesZombie?
    private(set) weak var type:MOptionWhistlesVsZombiesZombieItemProtocol!
    private(set) weak var lane:MOptionWhistlesVsZombiesGroundLane!
    
    init(
        type:MOptionWhistlesVsZombiesZombieItemProtocol,
        lane:MOptionWhistlesVsZombiesGroundLane)
    {
        self.type = type
        self.lane = lane
    }
    
    //MARK: public
    
    func wait()
    {
        
    }
    
    func walk()
    {
        
    }
}
