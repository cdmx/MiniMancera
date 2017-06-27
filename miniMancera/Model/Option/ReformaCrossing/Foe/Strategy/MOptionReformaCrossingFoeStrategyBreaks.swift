import Foundation

class MOptionReformaCrossingFoeStrategyBreaks:MOptionReformaCrossingFoeStrategy
{
    private(set) weak var model:MOptionReformaCrossingFoeItem!
    private var initialTime:TimeInterval?
    private let kBreaksDuration:TimeInterval = 1
    
    required init(model:MOptionReformaCrossingFoeItem)
    {
        self.model = model
    }
    
    func update(elapsedTime:TimeInterval)
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
