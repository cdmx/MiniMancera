import SpriteKit

class VOptionWhistlesVsZombiesBase:ViewGameNodeTouch<MOptionWhistlesVsZombies>
{
    private weak var model:MOptionWhistlesVsZombiesWhistleBase!
    private weak var animationOutIn:SKAction!
    
    init(
        controller:ControllerGame<MOptionWhistlesVsZombies>,
        model:MOptionWhistlesVsZombiesWhistleBase)
    {
        self.model = model
        let texture:MGameTexture = controller.model.textures.base
        animationOutIn = controller.model.actions.actionFadeOutIn
        
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
        position = model.position
    }
    
    override func touchesBegan(_ touches:Set<UITouch>, with event:UIEvent?)
    {
        run(animationOutIn)
    }
    
    //MARK: public
    
    func charged()
    {
        alpha = 0
    }
    
    func disCharged()
    {
        alpha = 1
    }
}
