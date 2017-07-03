import SpriteKit

class VOptionWhistlesVsZombiesBoardCancel:ViewGameNodeTouch<MOptionWhistlesVsZombies>
{
    private let kPositionAddY:CGFloat = 50
    private weak var animationOutIn:SKAction!
    
    override init(controller:ControllerGame<MOptionWhistlesVsZombies>)
    {
        let model:MOptionWhistlesVsZombies = controller.model
        let texture:MGameTexture = model.textures.boardCancel
        animationOutIn = model.actions.actionFadeOutIn
        
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
        let sceneHeight:CGFloat = MGame.sceneSize.height
        let sceneHeight_2:CGFloat = sceneHeight / 2.0
        let positionY:CGFloat =  kPositionAddY - sceneHeight_2
        position = CGPoint(x:0, y:positionY)
    }
    
    override func touchesBegan(_ touches:Set<UITouch>, with event:UIEvent?)
    {
        run(animationOutIn)
    }
}
