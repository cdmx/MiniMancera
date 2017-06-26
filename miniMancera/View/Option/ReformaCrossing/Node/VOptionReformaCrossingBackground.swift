import SpriteKit

class VOptionReformaCrossingBackground:ViewGameNode<MOptionReformaCrossing>
{
    override init(controller:ControllerGame<MOptionReformaCrossing>)
    {
        let texture:MGameTexture = controller.model.textures.background
        
        super.init(
            controller:controller,
            texture:texture.texture,
            size:texture.size,
            zPosition:MOptionReformaCrossingZPosition.Background.rawValue)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func positionStart()
    {
        let sceneSize:CGSize = MGame.sceneSize
        let sceneWidth:CGFloat = sceneSize.width
        let sceneHeight:CGFloat = sceneSize.height
        let sceneWidth_2:CGFloat = sceneWidth / 2.0
        let sceneHeight_2:CGFloat = sceneHeight / 2.0
        let centerPosition:CGPoint = CGPoint(x:sceneWidth_2, y:sceneHeight_2)
        position = centerPosition
    }
}
