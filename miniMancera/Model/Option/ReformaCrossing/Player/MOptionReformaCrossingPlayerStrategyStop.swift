import SpriteKit

class MOptionReformaCrossingPlayerStrategyStop:MGameStrategy<MOptionReformaCrossingPlayer>
{
    private var timeout:TimeInterval?
    private let kDuration:TimeInterval = 0.3
    
    override func update(elapsedTime:TimeInterval, scene:SKScene)
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
