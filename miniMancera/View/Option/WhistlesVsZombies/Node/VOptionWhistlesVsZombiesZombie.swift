import SpriteKit

class VOptionWhistlesVsZombiesZombie:ViewGameNode<MOptionWhistlesVsZombies>
{
    private weak var model:MOptionWhistlesVsZombiesZombieItem?
    
    init(
        controller:ControllerGame<MOptionWhistlesVsZombies>,
        model:MOptionWhistlesVsZombiesZombieItem)
    {
        self.model = model
        
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
        
        position = model.position()
    }
    
    //MARK: private
    
    private func startPhysics()
    {
        guard
            
            let model:MOptionWhistlesVsZombiesZombieItem = self.model,
            let modelTexture:MGameTexture = self.modelTexture
            
        else
        {
            return
        }
        
        let size:CGSize = modelTexture.size
        let physicsBody:SKPhysicsBody = SKPhysicsBody(rectangleOf:size)
        physicsBody.isDynamic = true
        physicsBody.friction = 0
        physicsBody.allowsRotation = false
        physicsBody.restitution = 1
        physicsBody.angularVelocity = 0
        //        physicsBody.density = model.mass
        
        physicsBody.categoryBitMask = MOptionWhistlesVsZombiesPhysicsStruct.Zombie
        physicsBody.contactTestBitMask = MOptionWhistlesVsZombiesPhysicsStruct.None
        physicsBody.collisionBitMask = MOptionWhistlesVsZombiesPhysicsStruct.None
        self.physicsBody = physicsBody
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
        run(animation)
    }
    
    func wait()
    {
        removeAllActions()
        texture = modelTexture?.texture
    }
}
