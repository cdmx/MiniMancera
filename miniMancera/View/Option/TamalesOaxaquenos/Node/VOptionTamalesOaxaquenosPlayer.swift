import SpriteKit

class VOptionTamalesOaxaquenosPlayer:ViewGameNode<MOptionTamalesOaxaquenos>
{
    private weak var actionWalking:SKAction!
    private let kPositionX:CGFloat = 100
    private let kPositionY:CGFloat = 200
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
        position = CGPoint(x:kPositionX, y:kPositionY)
    }
    
    //MARK: public
    
    func startWalking()
    {
        run(actionWalking, withKey:kWalkingKey)
    }
}
