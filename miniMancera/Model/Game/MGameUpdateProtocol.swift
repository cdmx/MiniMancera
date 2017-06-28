import SpriteKit

protocol MGameUpdateProtocol
{
    associatedtype modelType:MGame
    
    func update(elapsedTime:TimeInterval, scene:SKScene, model:modelType)
}
