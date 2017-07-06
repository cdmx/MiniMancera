import SpriteKit

class VOptionWhistlesVsZombiesSonicBoom:ViewGameNode<MOptionWhistlesVsZombies>
{
    private(set) weak var model:MOptionWhistlesVsZombiesSonicBoomItem?
    private weak var animatedTexture:MGameTextureAnimated!
    private let kColourBlendFactor:CGFloat = 1
    private let kVelocityX:CGFloat = 100
    
    init(
        controller:ControllerGame<MOptionWhistlesVsZombies>,
        model:MOptionWhistlesVsZombiesSonicBoomItem)
    {
        self.model = model
        animatedTexture = controller.model.textures.sonicBoomAnimated
        let animation:SKAction = controller.model.actions.actionSonicBoomAnimation
        let colour:UIColor = model.whistleType.colour
        
        super.init(
            controller:controller,
            size:animatedTexture.textureSize,
            zPosition:MOptionWhistlesVsZombiesZPosition.SonicBoom.rawValue,
            colour:colour)
        colorBlendFactor = kColourBlendFactor
        startPhysics()
        
        run(animation)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func positionStart()
    {
        guard
            
            let model:MOptionWhistlesVsZombiesSonicBoomItem = self.model
            
        else
        {
            return
        }
        
        let barrelLength:CGFloat = model.whistleType.barrelLength
        let basePosition:CGPoint = model.base.position
        let positionX:CGFloat = basePosition.x + barrelLength
        let positionY:CGFloat = basePosition.y
        position = CGPoint(
            x:positionX,
            y:positionY)
    }
    
    //MARK: private
    
    private func startPhysics()
    {
        guard
            
            let model:MOptionWhistlesVsZombiesSonicBoomItem = self.model,
            let animatedTexture:MGameTextureAnimated = self.animatedTexture
            
        else
        {
            return
        }
        
        let size:CGSize = animatedTexture.textureSize
        let physicsBody:SKPhysicsBody = SKPhysicsBody(rectangleOf:size)
        physicsBody.isDynamic = true
        physicsBody.friction = 0
        physicsBody.allowsRotation = false
        physicsBody.restitution = 1
        physicsBody.angularVelocity = 0
//        physicsBody.density = model.mass
        physicsBody.velocity = CGVector(
            dx:kVelocityX,
            dy:0)
        
        physicsBody.categoryBitMask = MOptionWhistlesVsZombiesPhysicsStruct.SonicBoom
        physicsBody.contactTestBitMask = MOptionWhistlesVsZombiesPhysicsStruct.None
        physicsBody.collisionBitMask = MOptionWhistlesVsZombiesPhysicsStruct.None
        self.physicsBody = physicsBody
    }
    
    //MARK: public
    
    func collisionFinish()
    {
        removeAllActions()
        removeFromParent()
    }
}
