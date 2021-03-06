import Foundation

class MOptionReformaCrossingFoeStrategyBreaks:MGameStrategy<
    MOptionReformaCrossingFoeItem,
    MOptionReformaCrossing>
{
    private var timeout:TimeInterval?
    private let kDuration:TimeInterval = 1
    
    override func update(
        elapsedTime:TimeInterval,
        scene:ViewGameScene<MOptionReformaCrossing>)
    {
        if let timeout:TimeInterval = self.timeout
        {
            if elapsedTime > timeout
            {
                model.strategyGas()
            }
        }
        else
        {
            timeout = elapsedTime + kDuration
        }
    }
}
