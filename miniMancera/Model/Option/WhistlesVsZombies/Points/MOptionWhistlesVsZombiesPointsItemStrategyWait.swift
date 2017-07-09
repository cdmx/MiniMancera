import Foundation

class MOptionWhistlesVsZombiesPointsItemStrategyWait:MGameStrategy<
    MOptionWhistlesVsZombiesPointsItem,
    MOptionWhistlesVsZombies>
{
    private var startingTime:TimeInterval?
    private let kDuration:TimeInterval = 1.5
    
    override func update(
        elapsedTime:TimeInterval,
        scene:ViewGameScene<MOptionWhistlesVsZombies>)
    {
        if let startingTime:TimeInterval = self.startingTime
        {
            let deltaTime:TimeInterval = elapsedTime - startingTime
            
            if deltaTime > kDuration
            {
                model.fade()
            }
        }
        else
        {
            startingTime = elapsedTime
            addView(scene:scene)
        }
    }
    
    //MARK: private
    
    private func addView(scene:ViewGameScene<MOptionWhistlesVsZombies>)
    {
        guard
        
            let scene:VOptionWhistlesVsZombiesScene = scene as? VOptionWhistlesVsZombiesScene,
            let modelZombie:MOptionWhistlesVsZombiesZombieItem = model.modelZombie
        
        else
        {
            return
        }
        
        scene.addPoints(model:model, modelZombie:modelZombie)
    }
}
