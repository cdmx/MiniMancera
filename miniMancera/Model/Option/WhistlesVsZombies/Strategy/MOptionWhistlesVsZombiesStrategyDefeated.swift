import Foundation

class MOptionWhistlesVsZombiesStrategyDefeated:MGameStrategyMain<MOptionWhistlesVsZombies>
{
    private var startingTime:TimeInterval?
    private let kWait:TimeInterval = 3.5
    
    init(model:MOptionWhistlesVsZombies)
    {
        let updateItems:[MGameUpdate<MOptionWhistlesVsZombies>] = [
            model.player,
            model.sonicBoom,
            model.zombie,
            model.points,
            model.hud]
        
        super.init(
            model:model,
            updateItems:updateItems)
    }
    
    override func update(
        elapsedTime:TimeInterval,
        scene:ViewGameScene<MOptionWhistlesVsZombies>)
    {
        super.update(elapsedTime:elapsedTime, scene:scene)
        
        if let startingTime:TimeInterval = self.startingTime
        {
            let deltaTime:TimeInterval = elapsedTime - startingTime
            
            if deltaTime > kWait
            {
                timeOut(scene:scene)
            }
        }
        else
        {
            startingTime = elapsedTime
        }
    }
    
    //MARK: private
    
    private func timeOut(scene:ViewGameScene<MOptionWhistlesVsZombies>)
    {
        guard
        
            let controller:COptionWhistlesVsZombies = scene.controller as? COptionWhistlesVsZombies
        
        else
        {
            return
        }
        
        controller.showGameOver()
    }
}
