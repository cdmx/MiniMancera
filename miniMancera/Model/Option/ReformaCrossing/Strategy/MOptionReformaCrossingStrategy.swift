import SpriteKit

protocol MOptionReformaCrossingStrategy
{
    weak var model:MOptionReformaCrossing! { get }
    
    init(model:MOptionReformaCrossing)
    
    func update(
        elapsedTime:TimeInterval,
        scene:SKScene)
}
