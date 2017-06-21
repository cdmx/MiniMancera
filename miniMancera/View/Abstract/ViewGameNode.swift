import SpriteKit

class ViewGameNode<S:MGameProtocol, T:ControllerGame<S>>:SKSpriteNode
{
    private(set) weak var controller:T!
    
    init(
        controller:T,
        texture:SKTexture? = nil,
        color:UIColor = UIColor.clear,
        size:CGSize = CGSize.zero)
    {
        self.controller = controller
        
        super.init(texture:texture, color:color, size:size)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
