import SpriteKit

class VOptionTamalesOaxaquenosPlayer:ViewGameNode<MOptionTamalesOaxaquenos>
{
    private weak var actionWalking:SKAction!
    private let kPositionX:CGFloat = 100
    private let kWalkingKey:String = "actionWalking"
    
    override init(controller:ControllerGame<MOptionTamalesOaxaquenos>)
    {
        let texture:MGameTexture = controller.model.textures.playerStand
        actionWalking = controller.model.actions.actionPlayerWalkingAnimation
        
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
        
        position = CGPoint(x:kPositionX, y:sceneHeight_2)
    }
    
    //MARK: public
    
    func stand()
    {
        removeAction(forKey:kWalkingKey)
    }
    
    func startWalking()
    {
        run(actionWalking, withKey:kWalkingKey)
    }
}
