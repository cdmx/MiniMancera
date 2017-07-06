import Foundation

class MOptionWhistlesVsZombiesSonicBoomItem:MGameUpdate<MOptionWhistlesVsZombies>
{
    weak var viewRelease:VOptionWhistlesVsZombiesSonicRelease?
    weak var viewBoom:VOptionWhistlesVsZombiesSonicBoom?
    private(set) weak var base:MOptionWhistlesVsZombiesWhistleBase!
    private(set) weak var whistleType:MOptionWhistlesVsZombiesWhistleTypeProtocol!
    private var strategy:MGameStrategy<MOptionWhistlesVsZombiesSonicBoomItem, MOptionWhistlesVsZombies>?
    
    init(
        base:MOptionWhistlesVsZombiesWhistleBase,
        whistleType:MOptionWhistlesVsZombiesWhistleTypeProtocol)
    {
        self.base = base
        self.whistleType = whistleType
        super.init()
        
        strategy = MOptionWhistlesVsZombiesSonicBoomItemStrategyRelease(
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
    
    //MARK: private
    
    private func createBoom(scene:ViewGameScene<MOptionWhistlesVsZombies>)
    {
        guard
            
            let scene:VOptionWhistlesVsZombiesScene = scene as? VOptionWhistlesVsZombiesScene
            
        else
        {
            return
        }
        
        scene.addSonicBoom(model:self)
    }
    
    //MARK: public
    
    func moving(scene:ViewGameScene<MOptionWhistlesVsZombies>)
    {
        strategy = MOptionWhistlesVsZombiesSonicBoomItemStrategyMoving(
            model:self)
        createBoom(scene:scene)
    }
    
    func collision()
    {
        strategy = MOptionWhistlesVsZombiesSonicBoomItemStrategyCollision(
            model:self)
    }
}
