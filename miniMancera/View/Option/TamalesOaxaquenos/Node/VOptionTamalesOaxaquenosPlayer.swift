import SpriteKit

class VOptionTamalesOaxaquenosPlayer:ViewGameNode<MOptionTamalesOaxaquenos>
{
    private weak var actionWalking:SKAction!
    private let kSubtractPositionX:CGFloat = 100
    private let kWalkingKey:String = "actionWalking"
    private let kRadius:CGFloat = 24
    private let kDensity:CGFloat = 1
    private let kImpulseX:CGFloat = 0.5
    
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
        let sceneSize:CGSize = MGame.sceneSize
        let sceneWidth:CGFloat = sceneSize.width
        let sceneHeight:CGFloat = sceneSize.height
        let sceneWidth_2:CGFloat = sceneWidth / 2.0
        let sceneHeight_2:CGFloat = sceneHeight / 2.0
        let positionX:CGFloat = sceneWidth_2 - kSubtractPositionX
        
        position = CGPoint(x:positionX, y:sceneHeight_2)
    }
    
    //MARK: private
    
    private func startPhysics()
    {
        let physicsBody:SKPhysicsBody = SKPhysicsBody(
            circleOfRadius:kRadius)
        physicsBody.isDynamic = true
        physicsBody.friction = 0
        physicsBody.allowsRotation = false
        physicsBody.restitution = 0
        physicsBody.angularVelocity = 0
        physicsBody.density = kDensity
        
        physicsBody.categoryBitMask = MOptionTamalesOaxaquenosPhysicsStruct.Player
        physicsBody.contactTestBitMask = MOptionTamalesOaxaquenosPhysicsStruct.None
        physicsBody.collisionBitMask = MOptionTamalesOaxaquenosPhysicsStruct.Floor
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
    
    func walk(moveAmount:CGFloat)
    {
        let deltaImpulse:CGFloat = moveAmount * kImpulseX
        let vector:CGVector = CGVector(dx:deltaImpulse, dy:0)
        
        physicsBody?.applyImpulse(vector)
    }
}
