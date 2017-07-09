import SpriteKit

class VOptionWhistlesVsZombiesWhistle:ViewGameNode<MOptionWhistlesVsZombies>
{
    private(set) weak var model:MOptionWhistlesVsZombiesWhistleBase!
    private weak var explodeAnimation:SKAction!
    
    init?(
        controller:ControllerGame<MOptionWhistlesVsZombies>,
        model:MOptionWhistlesVsZombiesWhistleBase)
    {
        guard
        
            let whistleType:MOptionWhistlesVsZombiesWhistleTypeProtocol = model.whistleType
        
        else
        {
            return nil
        }
        
        self.model = model
        explodeAnimation = controller.model.actions.actionWhistleExplodedAnimation
        
        super.init(
            controller:controller,
            texture:whistleType.texture)
        
        startPhysics()
        color = whistleType.colour
        colorBlendFactor = 0
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func positionStart()
    {
        position = model.position
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
        physicsBody.isDynamic = false
        physicsBody.friction = 0
        physicsBody.allowsRotation = false
        physicsBody.restitution = 0
        physicsBody.angularVelocity = 0
        physicsBody.density = 0
        
        physicsBody.categoryBitMask = MOptionWhistlesVsZombiesPhysicsStruct.Whistle
        physicsBody.contactTestBitMask = MOptionWhistlesVsZombiesPhysicsStruct.Zombie
        physicsBody.collisionBitMask = MOptionWhistlesVsZombiesPhysicsStruct.None
        self.physicsBody = physicsBody
    }
    
    //MARK: public
    
    func explode()
    {
        colorBlendFactor = 1
        run(explodeAnimation)
    }
}
