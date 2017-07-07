import UIKit

class MOptionWhistlesVsZombiesZombieItem:MGameUpdate<MOptionWhistlesVsZombies>
{
    weak var view:VOptionWhistlesVsZombiesZombie?
    private(set) weak var type:MOptionWhistlesVsZombiesZombieItemProtocol!
    private weak var lane:MOptionWhistlesVsZombiesGroundLane!
    private var positionX:CGFloat
    
    init(
        type:MOptionWhistlesVsZombiesZombieItemProtocol,
        lane:MOptionWhistlesVsZombiesGroundLane)
    {
        self.type = type
        self.lane = lane
        
        let sceneWidth:CGFloat = MGame.sceneSize.height
        let width_2:CGFloat = type.textureStand.width_2
        positionX = sceneWidth - width_2
    }
    
    //MARK: public
    
    func wait()
    {
        
    }
    
    func walk()
    {
        
    }
    
    func position() -> CGPoint
    {
        let point:CGPoint = CGPoint(
            x:positionX,
            y:lane.positionY)
        
        return point
    }
    
    func movePositionX(deltaX:CGFloat)
    {
        positionX += deltaX
    }
}
