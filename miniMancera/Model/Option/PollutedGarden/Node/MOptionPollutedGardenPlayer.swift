import UIKit
import SpriteKit

class MOptionPollutedGardenPlayer:SKSpriteNode
{
    private weak var controller:COptionPollutedGarden!
    private let textureStand:SKTexture
    private let kZPosition:CGFloat = 1
    private let kYPosition:CGFloat = 95
    
    init(controller:COptionPollutedGarden)
    {
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
    {/*
        let physicsBody:SKPhysicsBody = SKPhysicsBody(rectangleOf:size)
        physicsBody.isDynamic = false
        physicsBody.friction = 1
        physicsBody.angularVelocity = 0
        physicsBody.allowsRotation = false
        physicsBody.restitution = 0
        
        physicsBody.categoryBitMask = MOptionPollutedGardenPhysicsStruct.Floor
        physicsBody.contactTestBitMask = MOptionPollutedGardenPhysicsStruct.Bubble
        physicsBody.collisionBitMask = MOptionReformaCrossingPhysicsStruct.None
        self.physicsBody = physicsBody*/
    }
}
