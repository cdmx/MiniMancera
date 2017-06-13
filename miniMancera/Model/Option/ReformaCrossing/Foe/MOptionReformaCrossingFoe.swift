import UIKit
import SpriteKit

class MOptionReformaCrossingFoe:SKSpriteNode, MOptionReformaCrossingFoeProtocol
{
    let created:TimeInterval
    private(set) weak var lane:MOptionReformaCrossingLane!
    private weak var controller:COptionReformaCrossing!
    private let kActionMoving:String = "actionMoving"
    private let kPauseDuration:TimeInterval = 1
    private let kPhysicsHeight:CGFloat = 30
    private let kPhysicsAddWidth:CGFloat = 8
    
    class func randomFoe(
        lane:MOptionReformaCrossingLane,
        controller:COptionReformaCrossing) -> MOptionReformaCrossingFoe
    {
        let foe:MOptionReformaCrossingFoeVW = MOptionReformaCrossingFoeVW(
            lane:lane,
            controller:controller)
        
        return foe
    }
    
    init(lane:MOptionReformaCrossingLane, controller:COptionReformaCrossing)
    {
        let texture:SKTexture = SKTexture(image:#imageLiteral(resourceName: "assetReformaCrossingVW"))
        let size:CGSize = texture.size()
        self.controller = controller
        self.lane = lane
        created = Date().timeIntervalSince1970
        
        super.init(texture:texture, color:UIColor.clear, size:size)
        movement()
        scale()
        startPhysics(size:size)
        lane.foes.append(self)
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
        let startingPoint:CGPoint = lane.foeInitialPoint(foe:self)
        let endingPoint:CGPoint = lane.foeEndingPoint(foe:self)
        let duration:TimeInterval = movementDuration(
            startingPoint:startingPoint,
            endingPoint:endingPoint)
        
        position = startingPoint
        
        let actionMove:SKAction = SKAction.move(
            to:endingPoint,
            duration:duration)
        let actionLeaveStreet:SKAction = SKAction.run(leaveStreet)
        let actions:[SKAction] = [
            actionMove,
            actionLeaveStreet]
        let actionsSequence:SKAction = SKAction.sequence(actions)
        
        run(actionsSequence, withKey:kActionMoving)
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
        let totalMaxSpeed:UInt32 = controller.model.levelAddedMaxSpeed() + randomMaxSpeed
        let random:CGFloat = CGFloat(arc4random_uniform(totalMaxSpeed))
        let totalSpeed:CGFloat = minSpeed + random
        
        return totalSpeed
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
    
    private func resumeGas()
    {
        guard
            
            let actionMoving:SKAction = action(forKey:kActionMoving)
            
        else
        {
            return
        }
        
        actionMoving.speed = 1
    }
    
    //MARK: public
    
    func hitTheBreaks()
    {
        guard
            
            let actionMoving:SKAction = action(forKey:kActionMoving)
        
        else
        {
            return
        }
        
        actionMoving.speed = 0
        
        let actionDelay:SKAction = SKAction.wait(forDuration:kPauseDuration)
        let actionResume:SKAction = SKAction.run(resumeGas)
        let actions:[SKAction] = [
            actionDelay,
            actionResume]
        let actionsSequence:SKAction = SKAction.sequence(actions)
        
        run(actionsSequence)
    }
    
    func totalStop()
    {
        removeAction(forKey:kActionMoving)
    }
    
    //MARK: foe protocol
    
    var randomMaxSpeed:UInt32
    {
        get
        {
            return 0
        }
    }
    
    var minSpeed:CGFloat
    {
        get
        {
            return 0
        }
    }
}
