import UIKit
import SpriteKit

class MOptionPollutedGardenBubble:SKSpriteNode
{
    private(set) var alive:Bool
    private weak var controller:COptionPollutedGarden!
    private weak var bubbleType:MOptionPollutedGardenBubbleType!
    private let kMaxVelocity:UInt32 = 500
    
    init(
        controller:COptionPollutedGarden,
        bubbleType:MOptionPollutedGardenBubbleType,
        colour:UIColor,
        position:CGPoint)
    {
        alive = true
        
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
    
    private func startPhysics()
    {
        let velocityY:CGFloat = randomVelocity()
        let physicsBody:SKPhysicsBody = SKPhysicsBody(
            circleOfRadius:bubbleType.radius)
        physicsBody.isDynamic = true
        physicsBody.friction = 0
        physicsBody.allowsRotation = true
        physicsBody.restitution = 1
        physicsBody.angularVelocity = bubbleType.orientation.rawValue
        physicsBody.density = bubbleType.mass
        physicsBody.velocity = CGVector(
            dx:bubbleType.velocityX,
            dy:velocityY)
        
        physicsBody.categoryBitMask = MOptionPollutedGardenPhysicsStruct.Bubble
        physicsBody.contactTestBitMask = MOptionPollutedGardenPhysicsStruct.None
        physicsBody.collisionBitMask = MOptionPollutedGardenPhysicsStruct.Bubble | MOptionPollutedGardenPhysicsStruct.Scene
        self.physicsBody = physicsBody
    }
    
    private func animateAndLeave()
    {
        let actionExplosion:SKAction = controller.model.bubbleGenerator.explodeAnimation
        let actionLeave:SKAction = SKAction.run(leaveGarden)
        let actions:[SKAction] = [
            actionExplosion,
            actionLeave]
        let actionsSequence:SKAction = SKAction.sequence(actions)
        
        run(actionsSequence)
    }
    
    //MARK: public
    
    func explode()
    {
        alive = false
        animateAndLeave()
    }
}
