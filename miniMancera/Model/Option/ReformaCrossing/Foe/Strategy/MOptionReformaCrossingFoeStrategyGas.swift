import Foundation

class MOptionReformaCrossingFoeStrategyGas:MOptionReformaCrossingFoeStrategy
{
    private(set) weak var model:MOptionReformaCrossingFoeItem!
    
    required init(model:MOptionReformaCrossingFoeItem)
    {
        self.model = model
    }
    
    func update(elapsedTime:TimeInterval)
    {
        model.advance(elapsedTime:elapsedTime)
    }
}
