import Foundation

protocol MOptionReformaCrossingFoeStrategy
{
    weak var model:MOptionReformaCrossingFoeItem! { get }
    
    init(model:MOptionReformaCrossingFoeItem)
    
    func update(elapsedTime:TimeInterval)
}
