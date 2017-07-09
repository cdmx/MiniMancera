import Foundation

class MOptionWhistlesVsZombiesPointsItem:MGameUpdate<MOptionWhistlesVsZombies>
{
    weak var view:VOptionWhistlesVsZombiesPoints?
    private(set) weak var modelZombie:MOptionWhistlesVsZombiesZombieItem?
    private var strategy:MGameStrategy<MOptionWhistlesVsZombiesPointsItem, MOptionWhistlesVsZombies>?
    
    init(zombie:MOptionWhistlesVsZombiesZombieItem)
    {
        self.modelZombie = zombie
        super.init()
        
        strategy = MOptionWhistlesVsZombiesPointsItemStrategyWait(
            model:self)
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
    
    func fade()
    {
        strategy = MOptionWhistlesVsZombiesPointsItemStrategyFade(
            model:self)
    }
    
    func fadeFinished(scene:ViewGameScene<MOptionWhistlesVsZombies>)
    {
        scene.controller.model.points.removePoints(points:self)
        view?.finished()
    }
}
