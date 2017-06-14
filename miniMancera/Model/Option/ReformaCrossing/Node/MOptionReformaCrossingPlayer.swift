import UIKit
import SpriteKit

class MOptionReformaCrossingPlayer:SKSpriteNode
{
    private weak var controller:COptionReformaCrossing!
    private var lastElapsedTime:TimeInterval
    private var stopTime:TimeInterval?
    private let stopTextures:[SKTexture]
    private let kAddPointY:CGFloat = 205
    private let kSpeed:CGFloat = 70
    private let kActionWalking:String = "actionWalking"
    private let kAnimationPerFrame:TimeInterval = 0.1
    private let kStopAnimationPerFrame:TimeInterval = 0.04
    private let kStopDuration:TimeInterval = 0.3
    private let kZPosition:CGFloat = 10000
    private let kPhysicsWidth:CGFloat = 12
    private let kPhysicsHeight:CGFloat = 10
    private let kPhysicsYPos:CGFloat = -10
    
    private class func factoryAnimationTextures() -> [SKTexture]
    {
        let textureWalking1:SKTexture = SKTexture(image:#imageLiteral(resourceName: "assetReformaCrossingPlayer1"))
        let textureWalking2:SKTexture = SKTexture(image:#imageLiteral(resourceName: "assetReformaCrossingPlayer2"))
        let textureWalking3:SKTexture = SKTexture(image:#imageLiteral(resourceName: "assetReformaCrossingPlayer3"))
        let textureWalking4:SKTexture = SKTexture(image:#imageLiteral(resourceName: "assetReformaCrossingPlayer4"))
        let textureWalking5:SKTexture = SKTexture(image:#imageLiteral(resourceName: "assetReformaCrossingPlayer5"))
        let textureWalking6:SKTexture = SKTexture(image:#imageLiteral(resourceName: "assetReformaCrossingPlayer6"))
        let textures:[SKTexture] = [
            textureWalking1,
            textureWalking2,
            textureWalking3,
            textureWalking4,
            textureWalking5,
            textureWalking6]
        
        return textures
    }
    
    private class func factoryStopTextures() -> [SKTexture]
    {
        let textureWalking0:SKTexture = SKTexture(image:#imageLiteral(resourceName: "assetReformaCrossingPlayer0"))
        let textureWalking7:SKTexture = SKTexture(image:#imageLiteral(resourceName: "assetReformaCrossingPlayer7"))
        let textureWalking8:SKTexture = SKTexture(image:#imageLiteral(resourceName: "assetReformaCrossingPlayer8"))
        let textureWalking9:SKTexture = SKTexture(image:#imageLiteral(resourceName: "assetReformaCrossingPlayer9"))
        
        let textures:[SKTexture] = [
            textureWalking0,
            textureWalking7,
            textureWalking8,
            textureWalking9,
            textureWalking8,
            textureWalking7,
            textureWalking0]
        
        return textures
    }
    
    init(controller:COptionReformaCrossing)
    {
        self.controller = controller
        stopTextures = MOptionReformaCrossingPlayer.factoryStopTextures()
        let texture:SKTexture = stopTextures[0]
        
        let size:CGSize = texture.size()
        lastElapsedTime = 0
        
        super.init(texture:texture, color:UIColor.clear, size:size)
        position = startPosition()
        zPosition = kZPosition
        isHidden = true
        startPhysics()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: private
    
    private func startPosition() -> CGPoint
    {
        let sceneWidth_2:CGFloat = controller.model.size.width / 2.0
        let height_2:CGFloat = size.height / 2.0
        let point:CGPoint = CGPoint(x:sceneWidth_2, y:height_2)
        
        return point
    }
    
    private func finalPosition() -> CGPoint
    {
        let sceneSize:CGSize = controller.model.size
        let sceneWidth_2:CGFloat = sceneSize.width / 2.0
        let sceneHeight_2:CGFloat = sceneSize.height / 2.0
        let height_2:CGFloat = size.height / 2.0
        let positionY:CGFloat = sceneHeight_2 + height_2 + kAddPointY
        let point:CGPoint = CGPoint(x:sceneWidth_2, y:positionY)
        
        return point
    }
    
    private func startPhysics()
    {
        let physicsSize:CGSize = CGSize(width:kPhysicsWidth, height:kPhysicsHeight)
        let physicsCenter:CGPoint = CGPoint(x:0, y:kPhysicsYPos)
        
        let physicsBody:SKPhysicsBody = SKPhysicsBody(
            rectangleOf:physicsSize,
            center:physicsCenter)
        physicsBody.isDynamic = true
        physicsBody.friction = 0
        physicsBody.angularVelocity = 0
        physicsBody.allowsRotation = true
        physicsBody.restitution = 1
        
        physicsBody.categoryBitMask = MOptionReformaCrossingPhysicsStruct.Player
        physicsBody.contactTestBitMask = MOptionReformaCrossingPhysicsStruct.Foe
        physicsBody.collisionBitMask = MOptionReformaCrossingPhysicsStruct.Foe
        self.physicsBody = physicsBody
    }
    
    private func movementDuration(startingPoint:CGPoint, endingPoint:CGPoint) -> TimeInterval
    {
        let distance:CGFloat = abs(startingPoint.y - endingPoint.y)
        let translationTime:TimeInterval = TimeInterval(distance / kSpeed)
        
        return translationTime
    }
    
    private func createActionAnimating() -> SKAction
    {
        let animationTextures:[SKTexture] = MOptionReformaCrossingPlayer.factoryAnimationTextures()
        let actionAnimate:SKAction = SKAction.animate(
            with:animationTextures,
            timePerFrame:kAnimationPerFrame,
            resize:false,
            restore:false)
        let actionRepeat:SKAction = SKAction.repeatForever(actionAnimate)
        
        return actionRepeat
    }
    
    private func createActionMoving() -> SKAction
    {
        let finalPos:CGPoint = finalPosition()
        let duration:TimeInterval = movementDuration(
            startingPoint:position,
            endingPoint:finalPos)
        
        let actionWalk:SKAction = SKAction.move(
            to:finalPos,
            duration:duration)
        let actionSuccess:SKAction = SKAction.run(showSuccess)
        let actions:[SKAction] = [
            actionWalk,
            actionSuccess]
        let actionsSequence:SKAction = SKAction.sequence(actions)
        
        return actionsSequence
    }
    
    private func animateStop()
    {
        let actionAnimate:SKAction = SKAction.animate(
            with:stopTextures,
            timePerFrame:kStopAnimationPerFrame,
            resize:false,
            restore:false)
        
        run(actionAnimate)
    }
    
    private func resumeWalking()
    {
        stopTime = nil
        
        guard
            
            let actionWalking:SKAction = action(forKey:kActionWalking)
            
        else
        {
            return
        }
        
        actionWalking.speed = 1
    }
    
    private func measureStopTime()
    {
        stopTime = lastElapsedTime + kStopDuration
    }
    
    private func showSuccess()
    {
        removeAllActions()
        
        let textureSuccess:SKTexture = SKTexture(image:#imageLiteral(resourceName: "assetReformaCrossingPlayer12"))
        texture = textureSuccess
        
        controller.playerSuccess()
    }
    
    private func collectLanes()
    {
        guard
        
            let lane:MOptionReformaCrossingLane = controller.model.laneGroup.playerCollectAt(
                position:position)
        
        else
        {
            return
        }
        
        controller.collectedLane(lane:lane)
    }
    
    //MARK: public
    
    func update(elapsedTime:TimeInterval)
    {
        lastElapsedTime = elapsedTime
        
        if let stopTime:TimeInterval = self.stopTime
        {
            if stopTime < elapsedTime
            {
                resumeWalking()
            }
        }
        else
        {
            collectLanes()
        }
    }
    
    func startWalking()
    {
        isHidden = false
        
        let actionAnimating:SKAction = createActionAnimating()
        let actionMoving:SKAction = createActionMoving()
        let actions:[SKAction] = [
            actionAnimating,
            actionMoving]
        let actionsGroup:SKAction = SKAction.group(actions)
        
        run(actionsGroup, withKey:kActionWalking)
    }
    
    func stopWalking()
    {
        if stopTime == nil
        {
            guard
                
                let actionWalking:SKAction = action(forKey:kActionWalking)
                
            else
            {
                return
            }
            
            actionWalking.speed = 0
        }
        
        measureStopTime()
        animateStop()
    }
    
    func timeOut()
    {
        removeAllActions()
        
        let textureTimeOut:SKTexture = SKTexture(image:#imageLiteral(resourceName: "assetReformaCrossingPlayer11"))
        texture = textureTimeOut
    }
    
    func hitAndRun()
    {
        removeAllActions()
        
        let textureHitAndRun:SKTexture = SKTexture(image:#imageLiteral(resourceName: "assetReformaCrossingPlayer10"))
        let size:CGSize = textureHitAndRun.size()
        texture = textureHitAndRun
        self.size = size
    }
}
