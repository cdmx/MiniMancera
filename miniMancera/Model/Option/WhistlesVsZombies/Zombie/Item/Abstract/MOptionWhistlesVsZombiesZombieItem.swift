import UIKit

class MOptionWhistlesVsZombiesZombieItem:MGameUpdate<MOptionWhistlesVsZombies>
{
    weak var view:VOptionWhistlesVsZombiesZombie?
    private(set) weak var type:MOptionWhistlesVsZombiesZombieItemProtocol!
    private weak var lane:MOptionWhistlesVsZombiesGroundLane!
    private var strategy:MGameStrategy<MOptionWhistlesVsZombiesZombieItem, MOptionWhistlesVsZombies>?
    private let initialPositionX:CGFloat
    
    init(
        type:MOptionWhistlesVsZombiesZombieItemProtocol,
        lane:MOptionWhistlesVsZombiesGroundLane)
    {
        self.type = type
        self.lane = lane
        
        let sceneWidth:CGFloat = MGame.sceneSize.height
        let width_2:CGFloat = type.textureStand.width_2
        initialPositionX = sceneWidth - width_2
        
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
    
    func wait()
    {
        strategy = MOptionWhistlesVsZombiesZombieItemStrategyWait(model:self)
    }
    
    func walk()
    {
        strategy = MOptionWhistlesVsZombiesZombieItemStrategyWalk(model:self)
    }
    
    func initialPosition() -> CGPoint
    {
        let point:CGPoint = CGPoint(
            x:initialPositionX,
            y:lane.positionY)
        
        return point
    }
}
