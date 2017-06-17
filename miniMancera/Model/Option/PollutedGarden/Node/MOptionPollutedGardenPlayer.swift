import UIKit
import SpriteKit

class MOptionPollutedGardenPlayer:SKSpriteNode
{
    private weak var controller:COptionPollutedGarden!
    private let actionAnimate:SKAction
    private let textureStand:SKTexture
    private let kZPosition:CGFloat = 1
    private let kYPosition:CGFloat = 93
    private let kPhysicsWidth:CGFloat = 38
    private let kPhysicsHeight:CGFloat = 10
    private let kPhysicsY:CGFloat = 23
    
    init(controller:COptionPollutedGarden)
    {
        actionAnimate = MOptionPollutedGardenPlayer.factoryAnimation()
        textureStand = SKTexture(image:#imageLiteral(resourceName: "assetPollutedGardenPlayer1"))
        let textureSize:CGSize = textureStand.size()
        self.controller = controller
        
        super.init(texture:textureStand, color:UIColor.clear, size:textureSize)
        zPosition = kZPosition
        startPosition()
        startPhysics(size:textureSize)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: private
    
    private func startPosition()
    {
        let sceneWidth:CGFloat = controller.model.size.width
        let sceneWidth_2:CGFloat = sceneWidth / 2.0
        position = CGPoint(x:sceneWidth_2, y:kYPosition)
    }
    
    private func startPhysics(size:CGSize)
    {
        let physicsSize:CGSize = CGSize(width:kPhysicsWidth, height:kPhysicsHeight)
        let physicsCenter:CGPoint = CGPoint(x:0, y:kPhysicsY)
        let physicsBody:SKPhysicsBody = SKPhysicsBody(
            rectangleOf:physicsSize,
            center:physicsCenter)
        physicsBody.isDynamic = false
        physicsBody.friction = 1
        physicsBody.angularVelocity = 0
        physicsBody.allowsRotation = false
        physicsBody.restitution = 0
        
        physicsBody.categoryBitMask = MOptionPollutedGardenPhysicsStruct.Umbrella
        physicsBody.contactTestBitMask = MOptionPollutedGardenPhysicsStruct.Bubble
        physicsBody.collisionBitMask = MOptionReformaCrossingPhysicsStruct.None
        self.physicsBody = physicsBody
    }
}
