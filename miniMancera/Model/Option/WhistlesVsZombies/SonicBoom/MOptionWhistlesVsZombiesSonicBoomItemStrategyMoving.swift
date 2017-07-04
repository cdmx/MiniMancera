import Foundation

class MOptionWhistlesVsZombiesSonicBoomItemStrategyMoving:MGameStrategy<MOptionWhistlesVsZombiesSonicBoomItem,
    MOptionWhistlesVsZombies>
{
    private var lastElapsedTime:TimeInterval?
    private let kDuration:TimeInterval = 1
    
    override func update(
        elapsedTime:TimeInterval,
        scene:ViewGameScene<MOptionWhistlesVsZombies>)
    {
        if let lastElapsedTime:TimeInterval = self.lastElapsedTime
        {
            let deltaTime:TimeInterval = elapsedTime - lastElapsedTime
            
            
        }
        else
        {
            createView(scene:scene)
        }
        
        lastElapsedTime = elapsedTime
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
        
        scene.addSonicBoom(model:model)
    }
}
