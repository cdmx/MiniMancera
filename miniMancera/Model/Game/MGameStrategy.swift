import SpriteKit

class MGameStrategy<T:AnyObject>
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
