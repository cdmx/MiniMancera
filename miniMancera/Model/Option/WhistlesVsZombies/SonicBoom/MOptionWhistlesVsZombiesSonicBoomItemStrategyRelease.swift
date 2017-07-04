import Foundation

class MOptionWhistlesVsZombiesSonicBoomItemStrategyRelease:MGameStrategy<MOptionWhistlesVsZombiesSonicBoomItem,
    MOptionWhistlesVsZombies>
{
    private var startingTime:TimeInterval?
    private let kDuration:TimeInterval = 1
    
    override func update(
        elapsedTime:TimeInterval,
        scene:ViewGameScene<MOptionWhistlesVsZombies>)
    {
        if let startingTime:TimeInterval = self.startingTime
        {
            let deltaTime:TimeInterval = elapsedTime - startingTime
            
            if deltaTime > kDuration
            {
                model.moving()
            }
        }
        else
        {
            startingTime = elapsedTime
            createView(scene:scene)
        }
    }
    
    //MARK: private
    
    private func createView(scene:ViewGameScene<MOptionWhistlesVsZombies>)
    {
        guard
        
            let scene:VOptionWhistlesVsZombiesScene = scene as? VOptionWhistlesVsZombiesScene
        
        else
        {
            return
        }
        
        scene.addSonicBoomRelease(model:model)
    }
}
