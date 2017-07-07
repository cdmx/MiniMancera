import Foundation

class MOptionWhistlesVsZombiesZombieItem:MGameUpdate<MOptionWhistlesVsZombies>
{
    private(set) weak var type:MOptionWhistlesVsZombiesZombieItemProtocol!
    
    init(type:MOptionWhistlesVsZombiesZombieItemProtocol)
    {
        self.type = type
    }
}
