import SpriteKit

class VOptionTamalesOaxaquenosPlayer:ViewGameNode<MOptionTamalesOaxaquenos>
{
    private weak var actionWalking:SKAction!
    private let kPositionX:CGFloat = 100
    private let kWalkingKey:String = "actionWalking"
    private let kDensity:CGFloat = 1
    
    override init(controller:ControllerGame<MOptionTamalesOaxaquenos>)
    {
        let texture:MGameTexture = controller.model.textures.playerStand
        actionWalking = controller.model.actions.actionPlayerWalkingAnimation
        
        super.init(
            controller:controller,
            texture:texture)
        startPhysics()
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
    
    //MARK: private
    
    private func startPhysics()
    {
        guard
            
            let modelTexture:MGameTexture = self.modelTexture
            
        else
        {
            return
        }
        
        let radius:CGFloat = modelTexture.width_2
        let physicsBody:SKPhysicsBody = SKPhysicsBody(circleOfRadius:radius)
        physicsBody.isDynamic = true
        physicsBody.friction = 0
        physicsBody.allowsRotation = false
        physicsBody.restitution = 0
        physicsBody.angularVelocity = 0
        physicsBody.density = kDensity
        
        physicsBody.categoryBitMask = MOptionTamalesOaxaquenosPhysicsStruct.Player
        physicsBody.contactTestBitMask = MOptionTamalesOaxaquenosPhysicsStruct.None
        physicsBody.collisionBitMask = MOptionTamalesOaxaquenosPhysicsStruct.None
        self.physicsBody = physicsBody
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
