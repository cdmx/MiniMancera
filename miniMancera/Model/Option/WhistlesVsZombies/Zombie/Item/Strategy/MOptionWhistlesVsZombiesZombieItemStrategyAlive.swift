import Foundation

class MOptionWhistlesVsZombiesZombieItemStrategyAlive:MGameStrategy<
    MOptionWhistlesVsZombiesZombieItem,
    MOptionWhistlesVsZombies>
{
    private var accumulatedHit:Int
    
    override init(model:MOptionWhistlesVsZombiesZombieItem)
    {
        accumulatedHit = 0
        
        super.init(model:model)
    }
    
    override func update(
        elapsedTime:TimeInterval,
        scene:ViewGameScene<MOptionWhistlesVsZombies>)
    {
        if accumulatedHit > 0
        {
            model.reduceLife(amount:accumulatedHit)
            accumulatedHit = 0
            
            let alive:Bool = model.alive()
            
            if alive
            {
                animateHit()
            }
            else
            {
                zombieDefeated(scene:scene)
            }
        }
    }
    
    //MARK: private
    
    private func zombieDefeated(scene:ViewGameScene<MOptionWhistlesVsZombies>)
    {
        model.defeated(scene:scene)
    }
    
    private func animateHit()
    {
        model.view?.sonicHit()
    }
    
    //MARK: public
    
    func sonicHit(sonicBoom:MOptionWhistlesVsZombiesSonicBoomItem)
    {
        accumulatedHit += sonicBoom.whistleType.whistle.power
    }
}
