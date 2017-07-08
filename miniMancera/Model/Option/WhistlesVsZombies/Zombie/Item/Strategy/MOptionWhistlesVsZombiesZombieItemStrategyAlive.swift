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
                zombieDefeated()
            }
        }
    }
    
    //MARK: private
    
    private func zombieDefeated()
    {
        model.defeated()
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
