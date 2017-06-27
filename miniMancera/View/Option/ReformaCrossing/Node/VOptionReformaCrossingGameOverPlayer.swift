import SpriteKit

class VOptionReformaCrossingGameOverPlayer:ViewGameNode<MOptionReformaCrossing>
{
    init(controller:ControllerGame<MOptionReformaCrossing>, gameOver:MOptionReformaCrossingGameOverProtocol)
    {
        let model:MOptionReformaCrossing = controller.model
        let texture:MGameTexture = gameOver.texture(textures:model.textures)
        
        super.init(
            controller:controller,
            texture:texture)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func positionStart()
    {
        let sceneSize:CGSize = MGame.sceneSize
        let width_2:CGFloat = sceneSize.width / 2.0
        let height_2:CGFloat = sceneSize.height / 2.0
        
        position = CGPoint(x:width_2, y:height_2)
    }
}
