import SpriteKit

class VOptionWhistlesVsZombiesSonicBoom:ViewGameNode<MOptionWhistlesVsZombies>
{
    private(set) weak var model:MOptionWhistlesVsZombiesSonicBoomItem?
    private weak var animatedTexture:MGameTextureAnimated!
    private weak var animatedCollision:SKAction!
    private let vectorImpulse:CGVector
    private let velocityX:CGFloat
    private let density:CGFloat
    private let kColourBlendFactor:CGFloat = 1
    private let kVelocityX:CGFloat = 0.000005
    private let kDensity:CGFloat = 0.0000005
    
    init(
        controller:ControllerGame<MOptionWhistlesVsZombies>,
        model:MOptionWhistlesVsZombiesSonicBoomItem)
    {
        let mainModel:MOptionWhistlesVsZombies = controller.model
        let power:CGFloat = CGFloat(model.whistleType.whistle.power)
        velocityX = kVelocityX * power
        density = kDensity * power
        
        self.model = model
        animatedTexture = mainModel.textures.sonicBoomAnimated
        animatedCollision = mainModel.actions.actionSonicCollisionAnimation
        let animation:SKAction = mainModel.actions.actionSonicBoomAnimation
        let colour:UIColor = model.whistleType.colour
        vectorImpulse = CGVector(
            dx:velocityX,
            dy:0)
        
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
            
            let animatedTexture:MGameTextureAnimated = self.animatedTexture
            
        else
        {
            return
        }
        
        let radius:CGFloat = animatedTexture.textureSize.width / 2.0
        let physicsBody:SKPhysicsBody = SKPhysicsBody(circleOfRadius:radius)
        physicsBody.isDynamic = true
        physicsBody.friction = 0
        physicsBody.allowsRotation = false
        physicsBody.restitution = 0
        physicsBody.angularVelocity = 0
        physicsBody.density = density
        
        physicsBody.categoryBitMask = MOptionWhistlesVsZombiesPhysicsStruct.SonicBoom
        physicsBody.contactTestBitMask = MOptionWhistlesVsZombiesPhysicsStruct.None
        physicsBody.collisionBitMask = MOptionWhistlesVsZombiesPhysicsStruct.None
        self.physicsBody = physicsBody
    }
    
    //MARK: public
    
    func stop()
    {
        physicsBody?.velocity = CGVector.zero
    }
    
    func collisionAnimate()
    {
        removeAllActions()
        run(animatedCollision)
    }
    
    func collisionFinish()
    {
        removeAllActions()
        removeFromParent()
    }
    
    func shoot()
    {
        physicsBody?.applyImpulse(vectorImpulse)
    }
}
