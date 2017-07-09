import UIKit

class MOptionWhistlesVsZombiesZombieItem:MGameUpdate<MOptionWhistlesVsZombies>
{
    weak var view:VOptionWhistlesVsZombiesZombie?
    private(set) weak var type:MOptionWhistlesVsZombiesZombieItemProtocol!
    private(set) var life:Int
    private weak var lane:MOptionWhistlesVsZombiesGroundLane!
    private var strategy:MGameStrategy<MOptionWhistlesVsZombiesZombieItem, MOptionWhistlesVsZombies>?
    private let initialPositionX:CGFloat
    
    init(
        type:MOptionWhistlesVsZombiesZombieItemProtocol,
        lane:MOptionWhistlesVsZombiesGroundLane)
    {
        self.type = type
        self.lane = lane
        life = type.life
        
        let sceneWidth:CGFloat = MGame.sceneSize.height
        let width_2:CGFloat = type.textureStand.width_2
        initialPositionX = sceneWidth + width_2
        
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
        strategy = MOptionWhistlesVsZombiesZombieItemStrategyAliveWait(
            model:self)
    }
    
    func walk()
    {
        strategy = MOptionWhistlesVsZombiesZombieItemStrategyAliveWalk(
            model:self)
    }
    
    func defeated(scene:ViewGameScene<MOptionWhistlesVsZombies>)
    {
        scene.controller.model.zombieDefeated(zombie:self)
        
        strategy = MOptionWhistlesVsZombiesZombieItemStrategyDefeated(
            model:self)
    }
    
    func exploded()
    {
        life = 0
        
        strategy = MOptionWhistlesVsZombiesZombieItemStrategyDefeated(
            model:self)
    }
    
    func defeatedFinished(scene:ViewGameScene<MOptionWhistlesVsZombies>)
    {
        view?.defeatedFinished()
        scene.controller.model.zombie.zombieDefeated(zombie:self)
    }
    
    func initialPosition() -> CGPoint
    {
        let point:CGPoint = CGPoint(
            x:initialPositionX,
            y:lane.positionY)
        
        return point
    }
    
    func sonicHit(sonicBoom:MOptionWhistlesVsZombiesSonicBoomItem)
    {
        guard
        
            let strategy:MOptionWhistlesVsZombiesZombieItemStrategyAlive = self.strategy as? MOptionWhistlesVsZombiesZombieItemStrategyAlive
        
        else
        {
            return
        }
        
        strategy.sonicHit(sonicBoom:sonicBoom)
    }
    
    func alive() -> Bool
    {
        return life > 0
    }
    
    func reduceLife(amount:Int)
    {
        life -= amount
        
        if life < 0
        {
            life = 0
        }
    }
}
