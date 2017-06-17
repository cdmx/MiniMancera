import UIKit
import SpriteKit

class MOptionPollutedGardenPlayer:SKSpriteNode
{
    private weak var controller:COptionPollutedGarden!
    private let kZPosition:CGFloat = 1
    
    init(controller:COptionPollutedGarden)
    {
        let texture:SKTexture = SKTexture(image:#imageLiteral(resourceName: "assetPollutedGardenFloor"))
        let textureSize:CGSize = texture.size()
        self.controller = controller
        
        super.init(texture:texture, color:UIColor.clear, size:textureSize)
        
        let sceneSize:CGSize = controller.model.size
        let sceneWidth:CGFloat = sceneSize.width
        let sceneWidth_2:CGFloat = sceneWidth / 2.0
        let height_2:CGFloat = size.height / 2.0
        let centerPosition:CGPoint = CGPoint(x:sceneWidth_2, y:height_2)
        position = centerPosition
        zPosition = kZPosition
        
        startPhysics(size:textureSize)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: private
    
    private func startPosition() -> CGPoint
    {
        let potPosition:CGPoint = flowerPot.endingPoint
        let potX:CGFloat = potPosition.x
        let potY:CGFloat = potPosition.y
        let potHeight:CGFloat = flowerPot.size.height
        let potHeight_2:CGFloat = potHeight / 2.0
        let textureHeight:CGFloat = size.height
        let textureHeight_2:CGFloat = textureHeight / 2.0
        let positionY:CGFloat = potY + potHeight_2 + textureHeight_2
        let point:CGPoint = CGPoint(x:potX, y:positionY)
        
        return point
    }
    
    private func startPhysics(size:CGSize)
    {
        let physicsBody:SKPhysicsBody = SKPhysicsBody(rectangleOf:size)
        physicsBody.isDynamic = false
        physicsBody.friction = 1
        physicsBody.angularVelocity = 0
        physicsBody.allowsRotation = false
        physicsBody.restitution = 0
        
        physicsBody.categoryBitMask = MOptionPollutedGardenPhysicsStruct.Floor
        physicsBody.contactTestBitMask = MOptionPollutedGardenPhysicsStruct.Bubble
        physicsBody.collisionBitMask = MOptionReformaCrossingPhysicsStruct.None
        self.physicsBody = physicsBody
    }
}
