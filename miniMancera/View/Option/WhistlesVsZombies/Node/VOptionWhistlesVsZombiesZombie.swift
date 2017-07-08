import SpriteKit

class VOptionWhistlesVsZombiesZombie:ViewGameNode<MOptionWhistlesVsZombies>
{
    private(set) weak var model:MOptionWhistlesVsZombiesZombieItem?
    private weak var animationHit:SKAction!
    private let kActionWalkingKey:String = "actionWalking"
    private let kFriction:CGFloat = 1
    private let kRestitution:CGFloat = 0.1
    private let kDensity:CGFloat = 2
    
    init(
        controller:ControllerGame<MOptionWhistlesVsZombies>,
        model:MOptionWhistlesVsZombiesZombieItem)
    {
        self.model = model
        animationHit = controller.model.actions.actionZombieSonicHit
        
        super.init(
            controller:controller,
            texture:model.type.textureStand)
        startPhysics()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func positionStart()
    {
        guard
        
            let model:MOptionWhistlesVsZombiesZombieItem = self.model
        
        else
        {
            return
        }
        
        position = model.initialPosition()
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
        physicsBody.friction = kFriction
        physicsBody.allowsRotation = false
        physicsBody.restitution = kRestitution
        physicsBody.angularVelocity = 0
        physicsBody.density = kDensity
        
        physicsBody.categoryBitMask = MOptionWhistlesVsZombiesPhysicsStruct.Zombie
        physicsBody.contactTestBitMask = MOptionWhistlesVsZombiesPhysicsStruct.SonicBoom
        physicsBody.collisionBitMask = MOptionWhistlesVsZombiesPhysicsStruct.SonicBoom
        self.physicsBody = physicsBody
    }
    
    private func removePhysics()
    {
        guard
            
            let physicsBody:SKPhysicsBody = self.physicsBody
            
        else
        {
            return
        }
        
        physicsBody.velocity = CGVector.zero
        physicsBody.categoryBitMask = MOptionWhistlesVsZombiesPhysicsStruct.None
        physicsBody.contactTestBitMask = MOptionWhistlesVsZombiesPhysicsStruct.None
        physicsBody.collisionBitMask = MOptionWhistlesVsZombiesPhysicsStruct.None
    }
    
    private func animateDefeat()
    {
        guard
            
            let model:MOptionWhistlesVsZombiesZombieItem = self.model
            
        else
        {
            return
        }
        
        let animation:SKAction = model.type.animatedDefeat
        run(animation)
    }
    
    //MARK: public
    
    func walk()
    {
        guard
            
            let model:MOptionWhistlesVsZombiesZombieItem = self.model
            
        else
        {
            return
        }
        
        let animation:SKAction = model.type.animatedWalking
        run(animation, withKey:kActionWalkingKey)
    }
    
    func wait()
    {
        removeAction(forKey:kActionWalkingKey)
        
        physicsBody?.velocity = CGVector.zero
        texture = modelTexture?.texture
    }
    
    func move(force:CGFloat)
    {
        let vector:CGVector = CGVector(dx:force, dy:0)
        physicsBody?.applyForce(vector)
    }
    
    func sonicHit()
    {
        run(animationHit)
    }
    
    func defeated()
    {
        removeAction(forKey:kActionWalkingKey)
        removePhysics()
        animateDefeat()
    }
    
    func defeatedFinished()
    {
        removeAllActions()
        removeFromParent()
    }
}
