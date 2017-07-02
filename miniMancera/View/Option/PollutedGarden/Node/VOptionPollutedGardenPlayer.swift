import SpriteKit

class VOptionPollutedGardenPlayer:ViewGameNode<MOptionPollutedGarden>
{
    private let kPhysicsWidth:CGFloat = 42
    private let kPhysicsHeight:CGFloat = 11
    private let kPhysicsY:CGFloat = 23
    
    override init(controller:ControllerGame<MOptionPollutedGarden>)
    {
        let texture:MGameTexture = controller.model.textures.playerStand
        
        super.init(
            controller:controller,
            texture:texture)
        startPhysics()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: private
    
    private func startPhysics()
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
    
    //MARK: public
    
    func animateWalk(direction:CGFloat)
    {
        removeAllActions()
        
        xScale = direction
        let action:SKAction = controller.model.actions.actionPlayerAnimation
        run(action)
    }
    
    func stop()
    {
        removeAllActions()
        texture = modelTexture?.texture
    }
    
    func defeated(texture:MGameTexture)
    {
        removeAllActions()
        self.texture = texture.texture
    }
    
    /*
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
    }*/
}
