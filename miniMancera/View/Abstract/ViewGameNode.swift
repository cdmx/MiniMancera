import SpriteKit

class ViewGameNode<T:MGame>:SKSpriteNode
{
    private weak var controller:ControllerGame<T>!
    
    init(controller:ControllerGame<T>)
    {
        super.init(texture:nil, color:UIColor.clear, size:CGSize.zero)
    }
    
    init(
        controller:ControllerGame<T>,
        texture:SKTexture?,
        colour:UIColor = UIColor.clear,
        size:CGSize,
        zPosition:CGFloat)
    {
        self.controller = controller
        
        super.init(texture:texture, color:colour, size:size)
        positionStart()
        self.zPosition = zPosition
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: public
    
    func positionStart()
    {
    }
}
