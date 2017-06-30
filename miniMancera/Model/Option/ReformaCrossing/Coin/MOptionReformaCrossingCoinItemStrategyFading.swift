import SpriteKit

class MOptionReformaCrossingCoinItemStrategyFading:MGameStrategy<
    MOptionReformaCrossingCoinItem,
    MOptionReformaCrossing>
{
    private var elapsedTime:TimeInterval?
    private let kDuration:TimeInterval = 1
    
    override func update(
        elapsedTime:TimeInterval,
        scene:ViewGameScene<MOptionReformaCrossing>)
    {
        if let currentTime:TimeInterval = self.elapsedTime
        {
            let deltaTime:TimeInterval = elapsedTime - currentTime
            
            if deltaTime > kDuration
            {
                model.collected()
            }
        }
        else
        {
            self.elapsedTime = elapsedTime
        }
    }
}
