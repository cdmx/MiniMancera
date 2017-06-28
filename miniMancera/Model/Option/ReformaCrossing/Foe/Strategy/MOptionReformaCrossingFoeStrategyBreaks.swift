import SpriteKit

class MOptionReformaCrossingFoeStrategyBreaks:MGameStrategy<MOptionReformaCrossingFoeItem>
{
    private var initialTime:TimeInterval?
    private let kBreaksDuration:TimeInterval = 1
    
    override func update(elapsedTime:TimeInterval, scene:SKScene)
    {
        if let initialTime:TimeInterval = initialTime
        {
            let deltaTime:TimeInterval = elapsedTime - initialTime
            
            if deltaTime > kBreaksDuration
            {
                model.strategyGas()
            }
        }
        else
        {
            initialTime = elapsedTime
        }
    }
}
