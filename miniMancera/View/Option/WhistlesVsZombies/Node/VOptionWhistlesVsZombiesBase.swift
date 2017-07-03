import SpriteKit

class VOptionWhistlesVsZombiesBase:ViewGameNode<MOptionWhistlesVsZombies>
{
    private weak var model:MOptionWhistlesVsZombiesWhistleBase!
    
    init(
        controller:ControllerGame<MOptionWhistlesVsZombies>,
        model:MOptionWhistlesVsZombiesWhistleBase)
    {
        self.model = model
        let texture:MGameTexture = controller.model.textures.base
        
        super.init(
            controller:controller,
            texture:texture)
        isUserInteractionEnabled = true
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func positionStart()
    {
        position = model.position()
    }
    
    override func touchesBegan(_ touches:Set<UITouch>, with event:UIEvent?)
    {
    }
    
    override func touchesEnded(_ touches:Set<UITouch>, with event:UIEvent?)
    {
    }
}
