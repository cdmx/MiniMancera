import Foundation

class MOptionWhistlesVsZombiesPointsItemStrategyFade:MGameStrategy<
    MOptionWhistlesVsZombiesPointsItem,
    MOptionWhistlesVsZombies>
{
    private var startingTime:TimeInterval?
    private let kDuration:TimeInterval = 0.5
    
    override func update(
        elapsedTime:TimeInterval,
        scene:ViewGameScene<MOptionWhistlesVsZombies>)
    {
        if let startingTime:TimeInterval = self.startingTime
        {
            let deltaTime:TimeInterval = elapsedTime - startingTime
            
            if deltaTime > kDuration
            {
                model.fadeFinished(scene:scene)
            }
        }
        else
        {
            startingTime = elapsedTime
            model.view?.fade()
        }
    }
}
