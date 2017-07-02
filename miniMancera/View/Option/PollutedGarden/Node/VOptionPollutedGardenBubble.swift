import SpriteKit

class VOptionPollutedGardenBubble:ViewGameNode<MOptionPollutedGarden>
{
    private(set) weak var model:MOptionPollutedGardenBubbleItem?
    private let kColorBlendFactor:CGFloat = 1
    
    init(
        controller:ControllerGame<MOptionPollutedGarden>,
        model:MOptionPollutedGardenBubbleItem)
    {
        self.model = model
        super.init(
            controller:controller,
            texture:model.texture,
            colour:model.colour)
        xScale = model.scaleX
        colorBlendFactor = kColorBlendFactor
        startPhysics()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func positionStart()
    {
        guard
            
            let model:MOptionPollutedGardenBubbleItem = self.model
        
        else
        {
            return
        }
        
        position = model.position
    }
    
    //MARK: private
    
    private func startPhysics()
    {
        guard
            
            let model:MOptionPollutedGardenBubbleItem = self.model
        
        else
        {
            return
        }
        
        let physicsBody:SKPhysicsBody = SKPhysicsBody(
            circleOfRadius:model.radius)
        physicsBody.isDynamic = true
        physicsBody.friction = 0
        physicsBody.allowsRotation = true
        physicsBody.restitution = 1
        physicsBody.angularVelocity = model.angularVelocity
        physicsBody.density = model.mass
        physicsBody.velocity = CGVector(
            dx:model.velocityX,
            dy:model.velocityY)
        
        physicsBody.categoryBitMask = MOptionPollutedGardenPhysicsStruct.Bubble
        physicsBody.contactTestBitMask = MOptionPollutedGardenPhysicsStruct.None
        physicsBody.collisionBitMask = MOptionPollutedGardenPhysicsStruct.Bubble | MOptionPollutedGardenPhysicsStruct.Scene
        self.physicsBody = physicsBody
    }
    
    //MARK: public
    
    func explodeStart(animation:SKAction)
    {
        guard
            
            let model:MOptionPollutedGardenBubbleItem = self.model
        
        else
        {
            return
        }
        
        physicsBody?.velocity = CGVector(
            dx:model.velocityXExplosion,
            dy:model.velocityY)
        run(animation)
    }
    
    func explodeEnded()
    {
        removeAllActions()
        removeFromParent()
    }
}
