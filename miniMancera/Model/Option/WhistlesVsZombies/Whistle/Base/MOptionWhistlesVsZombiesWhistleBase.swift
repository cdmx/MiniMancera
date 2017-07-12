import UIKit

class MOptionWhistlesVsZombiesWhistleBase:MGameUpdate<MOptionWhistlesVsZombies>
{
    let position:CGPoint
    weak var viewBase:VOptionWhistlesVsZombiesBase?
    weak var viewWhistle:VOptionWhistlesVsZombiesWhistle?
    private(set) weak var whistleType:MOptionWhistlesVsZombiesWhistleTypeProtocol?
    private var strategy:MGameStrategy<MOptionWhistlesVsZombiesWhistleBase, MOptionWhistlesVsZombies>?
    
    init(position:CGPoint)
    {
        self.position = position
        super.init()
        
        wait()
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
    
    func alive() -> Bool
    {
        guard
        
            let _:MOptionWhistlesVsZombiesWhistleBaseStrategyCharged = strategy as? MOptionWhistlesVsZombiesWhistleBaseStrategyCharged
        
        else
        {
            return false
        }
        
        return true
    }
    
    func wait()
    {
        strategy = MOptionWhistlesVsZombiesWhistleBaseStrategyWait(model:self)
    }
    
    func charge(whistleType:MOptionWhistlesVsZombiesWhistleTypeProtocol)
    {
        self.whistleType = whistleType
        strategy = MOptionWhistlesVsZombiesWhistleBaseStrategyCharged(
            model:self,
            whistleType:whistleType)
        viewBase?.charged()
    }
    
    func explodeStart()
    {
        strategy = MOptionWhistlesVsZombiesWhistleBaseStrategyExploded(model:self)
    }
    
    func explodeFinish()
    {
        restart()
    }
    
    func restart()
    {
        whistleType = nil
        wait()
        viewBase?.disCharged()
        viewWhistle?.explodeFinished()
    }
}
