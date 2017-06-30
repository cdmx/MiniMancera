import SpriteKit

class VOptionPollutedGardenBubble:ViewGameNode<MOptionPollutedGarden>
{
    private weak var model:MOptionPollutedGardenBubbleItem?
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
    
    
    /*
    private(set) var alive:Bool
    private weak var bubbleType:MOptionPollutedGardenBubbleType!
    private let velocityExplosion:CGVector
    private let kExplosionVelocityY:CGFloat = 50
    private let kMaxVelocity:UInt32 = 100




    override init(controller:ControllerGame<MOptionPollutedGarden>)
    {
        
    }
    
    init(
        controller:COptionPollutedGarden,
        bubbleType:MOptionPollutedGardenBubbleType,
        colour:UIColor,
        position:CGPoint)
    {
        alive = true
        velocityExplosion = CGVector(
            dx:bubbleType.velocityXExplosion,
            dy:kExplosionVelocityY)
        
        super.init(
            texture:bubbleType.texture,
            color:colour,
            size:bubbleType.size)
        xScale = bubbleType.orientation.rawValue
        colorBlendFactor = 1
        self.position = position
        self.bubbleType = bubbleType
        self.controller = controller
        
        startPhysics()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: private
    
    private func leaveGarden()
    {
        removeAllActions()
        removeFromParent()
    }
    
    private func randomVelocity() -> CGFloat
    {
        let random:UInt32 = arc4random_uniform(kMaxVelocity)
        let vectorVelocity:CGFloat = -CGFloat(random)
        
        return vectorVelocity
    }
    
    
    
    private func animateAndLeave()
    {/*
        let actionExplosion:SKAction = controller.model.bubbleGenerator.explodeAnimation
        let actionLeave:SKAction = SKAction.run(leaveGarden)
        let actions:[SKAction] = [
            actionExplosion,
            actionLeave]
        let actionsSequence:SKAction = SKAction.sequence(actions)
        
        run(actionsSequence)*/
    }
    
    //MARK: public
    
    func explode()
    {
        alive = false
        physicsBody?.velocity = velocityExplosion
        animateAndLeave()
    }*/
}
