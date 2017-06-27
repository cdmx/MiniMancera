import SpriteKit

class MOptionReformaCrossingStrategyWait:MOptionReformaCrossingStrategy
{
    private(set) var model:MOptionReformaCrossing!
    
    required init(model:MOptionReformaCrossing)
    {
        self.model = model
    }

    func update(
        elapsedTime:TimeInterval,
        scene:SKScene)
    {
    }
}
