import Foundation

class MOptionReformaCrossingFoeStrategyBreaks:MOptionReformaCrossingFoeStrategy
{
    private(set) weak var model:MOptionReformaCrossingFoe!
    
    required init(model:MOptionReformaCrossingFoe)
    {
        self.model = model
    }
    
    func update(elapsedTime:TimeInterval)
    {
        
    }
}
