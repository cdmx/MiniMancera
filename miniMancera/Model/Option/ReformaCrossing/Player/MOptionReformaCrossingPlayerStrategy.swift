import Foundation

protocol MOptionReformaCrossingPlayerStrategy
{
    weak var model:MOptionReformaCrossingFoeItem! { get }
    
    init(model:MOptionReformaCrossingFoeItem)
    
    func update(elapsedTime:TimeInterval)
}
