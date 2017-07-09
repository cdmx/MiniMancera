import Foundation

class MOptionWhistlesVsZombiesZombieItemStrategyDefeated:MGameStrategy<
    MOptionWhistlesVsZombiesZombieItem,
    MOptionWhistlesVsZombies>
{
    private var startingTime:TimeInterval?
    private let kDuration:TimeInterval = 2.5
    
    override func update(
        elapsedTime:TimeInterval,
        scene:ViewGameScene<MOptionWhistlesVsZombies>)
    {
        if let startingTime:TimeInterval = self.startingTime
        {
            let deltaTime:TimeInterval = elapsedTime - startingTime
            
            if deltaTime > kDuration
            {
                timeOut(scene:scene)
            }
        }
        else
        {
            startingTime = elapsedTime
            model.view?.defeated()
        }
    }
    
    //MARK: private
    
    private func timeOut(scene:ViewGameScene<MOptionWhistlesVsZombies>)
    {
        model.defeatedFinished(scene:scene)
    }
}
