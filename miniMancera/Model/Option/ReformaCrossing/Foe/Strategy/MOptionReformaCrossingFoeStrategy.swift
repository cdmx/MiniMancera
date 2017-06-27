import Foundation

protocol MOptionReformaCrossingFoeStrategy
{
    weak var model:MOptionReformaCrossingFoe! { get }
    
    init(model:MOptionReformaCrossingFoe)
    
    func update(elapsedTime:TimeInterval)
}
