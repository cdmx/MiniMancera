import SpriteKit

class MGameStrategy<T:AnyObject, S:MGame>:MGameUpdate<S>
{
    private(set) weak var model:T!
    
    init(model:T)
    {
        self.model = model
    }
}
