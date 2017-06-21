import UIKit
import SpriteKit

class VOptionReformaCrossingFoe:SKSpriteNode
{
    let created:TimeInterval
    private weak var controller:COptionReformaCrossing!
    private(set) weak var lane:MOptionReformaCrossingLane!
    private(set) var randomMaxSpeed:UInt32
    private(set) var minSpeed:CGFloat
    private let kActionMoving:String = "actionMoving"
    private let kPauseDuration:TimeInterval = 1
    private let kPhysicsRemoveHeight:CGFloat = 6
    private let kPhysicsAddWidth:CGFloat = 8
    
    init(lane:MOptionReformaCrossingLane, controller:COptionReformaCrossing, image:UIImage)
    {
        let texture:SKTexture = SKTexture(image:image)
        let size:CGSize = texture.size()
        self.controller = controller
        self.lane = lane
        randomMaxSpeed = 0
        minSpeed = 0
        created = Date().timeIntervalSince1970
        
        super.init(texture:texture, color:UIColor.clear, size:size)
        movement()
        scale()
        startPhysics(size:size)
        lane.foes.append(self)
    }
    
    required init?(lane:MOptionReformaCrossingLane, controller:COptionReformaCrossing)
    {
        return nil
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
        let levelSpeed:CGFloat = controller.model.addedSpeed
        let random:CGFloat = CGFloat(arc4random_uniform(randomMaxSpeed))
        let totalSpeed:CGFloat = minSpeed + random + levelSpeed
        
        return totalSpeed
    }
    
    private func startPhysics(size:CGSize)
    {
        let physicsHeight:CGFloat = size.height - kPhysicsRemoveHeight
        let physicsWidth:CGFloat = size.width + kPhysicsAddWidth
        let physicsSize:CGSize = CGSize(width:physicsWidth, height:physicsHeight)
        
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
        removeAllActions()
    }
}
