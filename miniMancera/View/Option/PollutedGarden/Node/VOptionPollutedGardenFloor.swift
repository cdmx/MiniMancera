import UIKit
import SpriteKit

class VOptionPollutedGardenFloor:SKSpriteNode
{
    private weak var controller:COptionPollutedGarden!
    private let kZPosition:CGFloat = 100000
    
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
