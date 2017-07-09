import Foundation

class MOptionWhistlesVsZombiesWhistleBaseStrategyExploded:MGameStrategy<
    MOptionWhistlesVsZombiesWhistleBase,
    MOptionWhistlesVsZombies>
{
    private var startingTime:TimeInterval?
    private let kWait:TimeInterval = 1
    
    override func update(
        elapsedTime:TimeInterval,
        scene:ViewGameScene<MOptionWhistlesVsZombies>)
    {
        if let startingTime:TimeInterval = self.startingTime
        {
            let deltaTime:TimeInterval = elapsedTime - startingTime
            
            if deltaTime > kWait
            {
                timeOut()
            }
        }
        else
        {
            startingTime = elapsedTime
            showExploded()
        }
    }
    
    //MARK: private
    
    private func showExploded()
    {
        model.viewWhistle?.explode()
    }
    
    private func timeOut()
    {
        
    }
}
