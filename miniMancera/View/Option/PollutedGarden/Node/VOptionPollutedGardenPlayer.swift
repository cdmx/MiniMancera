import SpriteKit

class VOptionPollutedGardenPlayer:SKSpriteNode
{
    private weak var controller:COptionPollutedGarden!
    private let actionAnimate:SKAction
    private let textureStand:SKTexture
    private let kSpeed:CGFloat = 150
    private let kZPosition:CGFloat = 1
    private let kYPosition:CGFloat = 93
    private let kPhysicsWidth:CGFloat = 42
    private let kPhysicsHeight:CGFloat = 11
    private let kPhysicsY:CGFloat = 23
    
    init(controller:COptionPollutedGarden)
    {
        actionAnimate = VOptionPollutedGardenPlayer.factoryAnimation()
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
    {/*
        let sceneWidth:CGFloat = controller.model.size.width
        let sceneWidth_2:CGFloat = sceneWidth / 2.0
        position = CGPoint(x:sceneWidth_2, y:kYPosition)*/
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
    
    private func createActionMove(positionX:CGFloat) -> SKAction
    {
        let deltaX:CGFloat = abs(position.x - positionX)
        let duration:CGFloat = deltaX / kSpeed
        let durationTime:TimeInterval = TimeInterval(duration)
        let point:CGPoint = CGPoint(x:positionX, y:position.y)
        let actionMove:SKAction = SKAction.move(to:point, duration:durationTime)
        
        return actionMove
    }
    
    private func actionsWalk(positionX:CGFloat)
    {
        removeAllActions()
        
        let actionMove:SKAction = createActionMove(positionX:positionX)
        let actionReached:SKAction = SKAction.run(reachedPosition)
        let actions:[SKAction] = [
            actionMove,
            actionReached]
        let actionsSequence:SKAction = SKAction.sequence(actions)
        
        run(actionAnimate)
        run(actionsSequence)
    }
    
    private func reachedPosition()
    {
        removeAllActions()
        texture = textureStand
    }
    
    //MARK: public
    
    func walkToPosition(positionX:CGFloat)
    {
        if positionX >= position.x
        {
            xScale = 1
        }
        else
        {
            xScale = -1
        }
        
        actionsWalk(positionX:positionX)
    }
}
