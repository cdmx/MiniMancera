import UIKit
import SpriteKit

class MOptionReformaCrossingFoe:SKSpriteNode, MOptionReformaCrossingFoeProtocol
{
    private(set) weak var lane:MOptionReformaCrossingLaneProtocol!
    private weak var model:MOptionReformaCrossing!
    private let kMinSpeed:CGFloat = 10
    
    class func randomFoe(
        lane:MOptionReformaCrossingLaneProtocol,
        model:MOptionReformaCrossing) -> MOptionReformaCrossingFoe
    {
        let foe:MOptionReformaCrossingFoeVW = MOptionReformaCrossingFoeVW(
            lane:lane,
            model:model)
        
        return foe
    }
    
    init(lane:MOptionReformaCrossingLaneProtocol, model:MOptionReformaCrossing)
    {
        let texture:SKTexture = SKTexture(image:#imageLiteral(resourceName: "assetReformaCrossingVW"))
        let size:CGSize = texture.size()
        self.model = model
        self.lane = lane
        
        super.init(texture:texture, color:UIColor.clear, size:size)
        movement()
        scale()
        startPhysics(size:size)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: private
    
    private func scale()
    {
        xScale = xScale * lane.scaleHorizontal
    }
    
    private func movement()
    {
        let startingPoint:CGPoint = lane.foeInitialPoint(
            foe:self,
            sceneSize:model.size)
        let endingPoint:CGPoint = lane.foeEndingPoint(
            foe:self,
            sceneSize:model.size)
        let duration:TimeInterval = movementDuration(
            startingPoint:startingPoint,
            endingPoint:endingPoint)
        
        position = startingPoint
        
        let actionMove:SKAction = SKAction.move(
            to:endingPoint,
            duration:duration)
        let actionExit:SKAction = SKAction.removeFromParent()
        let actions:[SKAction] = [
            actionMove,
            actionExit]
        let actionsSequence:SKAction = SKAction.sequence(actions)
        
        run(actionsSequence)
    }
    
    private func movementDuration(startingPoint:CGPoint, endingPoint:CGPoint) -> TimeInterval
    {
        let distance:CGFloat = abs(startingPoint.x - endingPoint.x)
        let speed:CGFloat = randomSpeed()
        let translationTime:TimeInterval = TimeInterval(distance / speed)
        
        return translationTime
    }
    
    private func randomSpeed() -> CGFloat
    {
        let totalMaxSpeed:UInt32 = model.levelAddedMaxSpeed() + randomMaxSpeed
        let random:CGFloat = CGFloat(arc4random_uniform(totalMaxSpeed))
        let totalSpeed:CGFloat = kMinSpeed + random
        
        return totalSpeed
    }
    
    private func startPhysics(size:CGSize)
    {
        let physicsBody:SKPhysicsBody = SKPhysicsBody(rectangleOf:size)
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
    
    //MARK: foe protocol
    
    var randomMaxSpeed:UInt32
    {
        get
        {
            return 0
        }
    }
}
