import SpriteKit

class MOptionReformaCrossingPlayerStrategyStop:MGameStrategy<
    MOptionReformaCrossingPlayer,
    MOptionReformaCrossing>
{
    private var timeout:TimeInterval?
    private let kDuration:TimeInterval = 0.3
    
    override func update(
        elapsedTime:TimeInterval,
        scene:ViewGameScene<MOptionReformaCrossing>)
    {
        if let timeout:TimeInterval = self.timeout
        {
            if elapsedTime > timeout
            {
                model.walk()
            }
        }
        else
        {
            timeout = elapsedTime + kDuration
        }
    }
}
