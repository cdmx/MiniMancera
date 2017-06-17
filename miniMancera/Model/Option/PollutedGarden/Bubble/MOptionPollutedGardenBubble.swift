import UIKit
import SpriteKit

class MOptionPollutedGardenBubble:SKSpriteNode
{
    private weak var controller:COptionPollutedGarden!
    private weak var bubbleType:MOptionPollutedGardenBubbleType!
    
    init(
        controller:COptionPollutedGarden,
        bubbleType:MOptionPollutedGardenBubbleType,
        colour:UIColor,
        position:CGPoint)
    {
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
    
    private func startPhysics()
    {
        let physicsBody:SKPhysicsBody = SKPhysicsBody(
            circleOfRadius:bubbleType.radius)
        physicsBody.isDynamic = true
        physicsBody.friction = 0
        physicsBody.angularVelocity = 1
        physicsBody.allowsRotation = true
        physicsBody.restitution = 1
        physicsBody.mass = bubbleType.mass
        physicsBody.velocity = CGVector(
            dx:bubbleType.velocityX,
            dy:0)
        
        physicsBody.categoryBitMask = MOptionPollutedGardenPhysicsStruct.Bubble
        physicsBody.contactTestBitMask = MOptionPollutedGardenPhysicsStruct.None
        physicsBody.collisionBitMask = MOptionPollutedGardenPhysicsStruct.None
        self.physicsBody = physicsBody
    }
}
