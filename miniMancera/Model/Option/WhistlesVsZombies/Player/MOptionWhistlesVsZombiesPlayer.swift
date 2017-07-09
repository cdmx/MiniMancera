import Foundation

class MOptionWhistlesVsZombiesPlayer:MGameUpdate<MOptionWhistlesVsZombies>
{
    weak var view:VOptionWhistlesVsZombiesPlayer?
    private var strategy:MGameStrategy<MOptionWhistlesVsZombiesPlayer, MOptionWhistlesVsZombies>?
    
    override init()
    {
        super.init()
        
        stand()
    }
    
    override func update(
        elapsedTime:TimeInterval,
        scene:ViewGameScene<MOptionWhistlesVsZombies>)
    {
        strategy?.update(
            elapsedTime:elapsedTime,
            scene:scene)
    }
    
    //MARK: public
    
    func stand()
    {
        strategy = MOptionWhistlesVsZombiesPlayerStrategyAliveStand(model:self)
    }
    
    func sweat()
    {
        strategy = MOptionWhistlesVsZombiesPlayerStrategyAliveSweat(model:self)
    }
    
    func shut()
    {
        strategy = MOptionWhistlesVsZombiesPlayerStrategyAliveShut(model:self)
    }
    
    func scared()
    {
        strategy = MOptionWhistlesVsZombiesPlayerStrategyAliveScared(model:self)
    }
    
    func defeated()
    {
        strategy = MOptionWhistlesVsZombiesPlayerStrategyDefeated(model:self)
    }
}
