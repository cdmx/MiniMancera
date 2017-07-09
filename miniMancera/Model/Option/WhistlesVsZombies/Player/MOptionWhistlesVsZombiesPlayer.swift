import Foundation

class MOptionWhistlesVsZombiesPlayer:MGameUpdate<MOptionWhistlesVsZombies>
{
    private var strategy:MGameStrategy<MOptionWhistlesVsZombiesPlayer, MOptionWhistlesVsZombies>?
    
    override init()
    {
        super.init()
        
        stand()
    }
    
    //MARK: public
    
    func stand()
    {
        strategy
    }
    
    func scare()
    {
        
    }
    
    func sweat()
    {
        
    }
    
    func defeated()
    {
        
    }
}
