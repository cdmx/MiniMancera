import SpriteKit

class VOptionReformaCrossingFoe:ViewGameNode<MOptionReformaCrossing>
{
    private weak var controller:COptionReformaCrossing!
    private(set) var randomMaxSpeed:UInt32
    private(set) var minSpeed:CGFloat
    private let kActionMoving:String = "actionMoving"
    private let kPhysicsRemoveHeight:CGFloat = 6
    private let kPhysicsAddWidth:CGFloat = 8
    
    init?(controller:ControllerGame<MOptionReformaCrossing>, model:MOptionReformaCrossingFoeItem)
    {
        guard
            
            let texture:MGameTexture = model.texture
            
            else
        {
            return nil
        }
        
        super.init(
            controller:controller,
            texture:texture.texture,
            size:texture.size,
            zPosition:MOptionReformaCrossingZPosition.Foe.rawValue)
        
        let lane:MOptionReformaCrossingLane = model.lane
        xScale = lane.scaleHorizontal
        movement(lane:lane)
        startPhysics(size:size)
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
    
    private func movement(lane:MOptionReformaCrossingLane)
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
        let levelSpeed:CGFloat = 1 // controller.model.addedSpeed
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
