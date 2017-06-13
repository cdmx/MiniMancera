import UIKit
import SpriteKit

class MOptionReformaCrossingCoin:SKSpriteNode
{
    private weak var controller:COptionReformaCrossing!
    private let kAddPositionX:CGFloat = 100
    private let kAddPositionY:CGFloat = 20
    
    init(lane:MOptionReformaCrossingLane, controller:COptionReformaCrossing)
    {
        let texture:SKTexture = SKTexture(image:#imageLiteral(resourceName: "assetReformaCrossingCoin"))
        let size:CGSize = texture.size()
        self.controller = controller
        
        super.init(texture:texture, color:UIColor.clear, size:size)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: private
    
    private func startPosition(lane:MOptionReformaCrossingLane)
    {
        let sceneWidth_2:CGFloat = controller.model.size.width / 2.0
        let positionX:CGFloat = sceneWidth_2 + kAddPositionX
        let positionY:CGFloat = lane.verticalPosition + kAddPositionY
        position = CGPoint(x:positionX, y:positionY)
    }
    
    private func movementDuration(startingPoint:CGPoint, endingPoint:CGPoint) -> TimeInterval
    {
        let distance:CGFloat = abs(startingPoint.x - endingPoint.x)
        let speed:CGFloat = randomSpeed()
        let translationTime:TimeInterval = TimeInterval(distance / speed)
        
        return translationTime
    }
    
    
    private func startPhysics(size:CGSize)
    {
        let physicsWidth:CGFloat = size.width + kPhysicsAddWidth
        let physicsSize:CGSize = CGSize(width:physicsWidth, height:kPhysicsHeight)
        
        let physicsBody:SKPhysicsBody = SKPhysicsBody(rectangleOf:physicsSize)
        physicsBody.isDynamic = true
        physicsBody.friction = 1
        physicsBody.angularVelocity = 0
        physicsBody.allowsRotation = false
        physicsBody.restitution = 0
        
        physicsBody.categoryBitMask = MOptionReformaCrossingPhysicsStruct.Foe
        physicsBody.contactTestBitMask = MOptionReformaCrossingPhysicsStruct.Foe
        physicsBody.collisionBitMask = MOptionReformaCrossingPhysicsStruct.None
        self.physicsBody = physicsBody
    }
    
    private func leaveStreet()
    {
        lane.removeFoe(item:self)
        removeAllActions()
        removeFromParent()
    }
}
