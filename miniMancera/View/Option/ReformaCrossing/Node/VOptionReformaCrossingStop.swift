import SpriteKit

class VOptionReformaCrossingStop:ViewGameNode<MOptionReformaCrossing>
{
    private weak var textureAnimated:MGameTextureAnimated!
    
    override init(controller:ControllerGame<MOptionReformaCrossing>)
    {
        let textures:MOptionReformaCrossingTextures = controller.model.textures
        let texture:MGameTexture = textures.stop
        textureAnimated = textures.stopAnimated
        
        super.init(
            controller:controller,
            texture:texture)
        isUserInteractionEnabled = true
        alpha = 0
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func positionStart()
    {
        let sceneWidth:CGFloat = MGame.sceneSize.width
        let sceneWidth_2:CGFloat = sceneWidth / 2.0
        let height_2:CGFloat = modelTexture.height_2
        position = CGPoint(x:sceneWidth_2, y:height_2)
    }
    
    override func touchesEnded(_ touches:Set<UITouch>, with event:UIEvent?)
    {
        guard
        
            let controller:COptionReformaCrossing = self.controller as? COptionReformaCrossing
        
        else
        {
            return
        }
        
        controller.playerStop()
    }
}
