import UIKit

class MOptionWhistlesVsZombiesWhistleBase:MGameUpdate<MOptionWhistlesVsZombies>
{
    weak var viewBase:VOptionWhistlesVsZombiesBase?
    weak var viewWhistle:VOptionWhistlesVsZombiesWhistle?
    private(set) weak var whistleType:MOptionWhistlesVsZombiesWhistleType?
    private var strategy:MGameStrategy<MOptionWhistlesVsZombiesWhistleBase, MOptionWhistlesVsZombies>?
    private let positionX:CGFloat
    private let kPositionY:CGFloat = 100
    
    init(positionX:CGFloat)
    {
        self.positionX = positionX
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
    
    func position() -> CGPoint
    {
        let point:CGPoint = CGPoint(
            x:positionX,
            y:kPositionY)
        
        return point
    }
    
    func charge(whistleType:MOptionWhistlesVsZombiesWhistleType)
    {
        self.whistleType = whistleType
        strategy = MOptionWhistlesVsZombiesWhistleBaseStrategyCharged(model:self)
        viewBase?.charged()
    }
}
