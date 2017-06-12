import UIKit
import SpriteKit

class MOptionReformaCrossingFoe:SKSpriteNode, MOptionReformaCrossingFoeProtocol
{
    private(set) weak var lane:MOptionReformaCrossingLane!
    private weak var model:MOptionReformaCrossing!
    private let kActionMoving:String = "actionMoving"
    private let kMinSpeed:CGFloat = 10
    private let kPauseDuration:TimeInterval = 1
    private let kPhysicsHeight:CGFloat = 22
    private let kPhysicsAddWidth:CGFloat = 5
    
    class func randomFoe(
        lane:MOptionReformaCrossingLane,
        model:MOptionReformaCrossing) -> MOptionReformaCrossingFoe
    {
        let foe:MOptionReformaCrossingFoeVW = MOptionReformaCrossingFoeVW(
            lane:lane,
            model:model)
        
        return foe
    }
    
    init(lane:MOptionReformaCrossingLane, model:MOptionReformaCrossing)
    {
        let texture:SKTexture = SKTexture(image:#imageLiteral(resourceName: "assetReformaCrossingVW"))
        let size:CGSize = texture.size()
        self.model = model
        self.lane = lane
        
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
        let actionLeaveStreet:SKAction = SKAction.run(leaveStreet)
        let actions:[SKAction] = [
            actionMove,
            actionLeaveStreet]
        let actionsSequence:SKAction = SKAction.sequence(actions)
        self.actionMove = actionMove
        
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
        let totalMaxSpeed:UInt32 = model.levelAddedMaxSpeed() + randomMaxSpeed
        let random:CGFloat = CGFloat(arc4random_uniform(totalMaxSpeed))
        let totalSpeed:CGFloat = kMinSpeed + random
        
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
    
    //MARK: foe protocol
    
    var randomMaxSpeed:UInt32
    {
        get
        {
            return 0
        }
    }
}
