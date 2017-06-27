import SpriteKit

class ViewGameNode<T:MGame>:SKSpriteNode
{
    private(set) weak var controller:ControllerGame<T>!
    private(set) weak var modelTexture:MGameTexture!
    
    init(controller:ControllerGame<T>)
    {
        super.init(texture:nil, color:UIColor.clear, size:CGSize.zero)
    }
    
    init(
        controller:ControllerGame<T>,
        texture:MGameTexture,
        colour:UIColor = UIColor.clear)
    {
        self.controller = controller
        self.modelTexture = texture
        
        super.init(
            texture:texture.texture,
            color:colour,
            size:texture.size)

        zPosition = texture.zPosition
        positionStart()
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
