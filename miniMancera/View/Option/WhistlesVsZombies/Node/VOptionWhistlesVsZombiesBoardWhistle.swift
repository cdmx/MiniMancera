import SpriteKit

class VOptionWhistlesVsZombiesBoardWhistle:ViewGameNodeTouch<MOptionWhistlesVsZombies>
{
    private let positionY:CGFloat
    private weak var animationOutIn:SKAction!
    
    init?(
        controller:ControllerGame<MOptionWhistlesVsZombies>,
        model:MOptionWhistlesVsZombiesWhistleType,
        positionY:CGFloat)
    {
        guard
            
            let texture:MGameTexture = model.textureBoard
        
        else
        {
            return nil
        }
        
        animationOutIn = controller.model.actions.actionFadeOutIn
        self.positionY = positionY
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
        position = CGPoint(x:0, y:positionY)
    }
    
    override func touchesBegan(_ touches:Set<UITouch>, with event:UIEvent?)
    {
        run(animationOutIn)
    }
}
