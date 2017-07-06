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
        
        strategy = MOptionWhistlesVsZombiesWhistleBaseStrategyWait(model:self)
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
    
    func charge(whistleType:MOptionWhistlesVsZombiesWhistleTypeProtocol)
    {
        self.whistleType = whistleType
        strategy = MOptionWhistlesVsZombiesWhistleBaseStrategyCharged(
            model:self,
            whistleType:whistleType)
        viewBase?.charged()
    }
}
