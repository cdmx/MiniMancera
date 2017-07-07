import Foundation

class VOptionWhistlesVsZombiesZombie:ViewGameNode<MOptionWhistlesVsZombies>
{
    private weak var model:MOptionWhistlesVsZombiesZombieItem?
    
    override init(
        controller:ControllerGame<MOptionWhistlesVsZombies>,
        model:MOptionWhistlesVsZombiesZombieItem)
    {
        self.model = model
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
