import SpriteKit

class MGameStrategy<T:MGame>
{
    private(set) weak var model:T!
    
    init(model:T)
    {
        self.model = model
    }
    
    //MARK: public
    
    func update(
        elapsedTime:TimeInterval,
        scene:SKScene)
    {
        
    }
}
