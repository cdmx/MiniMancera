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
            circleOfRadius:bubbleType.size.width)
        physicsBody.isDynamic = false
        physicsBody.friction = 0
        physicsBody.angularVelocity = 0
        physicsBody.allowsRotation = true
        physicsBody.restitution = 1
        
        physicsBody.categoryBitMask = MOptionReformaCrossingPhysicsStruct.Player
        physicsBody.contactTestBitMask = MOptionReformaCrossingPhysicsStruct.Foe
        physicsBody.collisionBitMask = MOptionReformaCrossingPhysicsStruct.Foe
        self.physicsBody = physicsBody
    }
}
