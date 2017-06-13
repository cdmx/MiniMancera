import UIKit
import SpriteKit

class MOptionReformaCrossingPlayer:SKSpriteNode
{
    private weak var controller:COptionReformaCrossing!
    private let positionSafe:CGFloat
    private let kAddPointY:CGFloat = 200
    private let kSpeed:CGFloat = 35
    private let kActionWalking:String = "actionWalking"
    private let kActionAnimate:String = "actionAnimate"
    private let kAnimationPerFrame:TimeInterval = 0.2
    private let kZPosition:CGFloat = 0
    private let kStopDuration:TimeInterval = 0.5
    
    init(controller:COptionReformaCrossing)
    {
        let texture:SKTexture = SKTexture(image:#imageLiteral(resourceName: "assetReformaCrossingPlayer0"))
        let size:CGSize = texture.size()
        let sceneHeight_2:CGFloat = controller.model.size.height / 2.0
        let height_2:CGFloat = size.height / 2.0
        positionSafe = sceneHeight_2 + height_2 + kAddPointY
        self.controller = controller
        
        super.init(texture:texture, color:UIColor.clear, size:size)
        position = startPosition()
        zPosition = kZPosition
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
        let sceneHeight:CGFloat = sceneSize.height
        let positionY:CGFloat = sceneHeight + size.height
        let point:CGPoint = CGPoint(x:sceneWidth_2, y:positionY)
        
        return point
    }
    
    private func createActionAnimate() -> SKAction
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
        
        let actionAnimate:SKAction = SKAction.animate(
            with:textures,
            timePerFrame:kAnimationPerFrame,
            resize:false,
            restore:true)
        let actionRepeat:SKAction = SKAction.repeatForever(actionAnimate)
        
        return actionRepeat
    }
    
    private func createActionWalk() -> SKAction
    {
        let finalPos:CGPoint = finalPosition()
        let duration:TimeInterval = movementDuration(
            startingPoint:position,
            endingPoint:finalPos)
        
        let actionWalk:SKAction = SKAction.move(
            to:finalPos,
            duration:duration)
        
        return actionWalk
    }
    
    private func movementDuration(startingPoint:CGPoint, endingPoint:CGPoint) -> TimeInterval
    {
        let distance:CGFloat = abs(startingPoint.y - endingPoint.y)
        let translationTime:TimeInterval = TimeInterval(distance / kSpeed)
        
        return translationTime
    }
    
    private func startAnimating()
    {
        let actionAnimate:SKAction = createActionAnimate()
        
        run(actionAnimate, withKey:kActionAnimate)
    }
    
    private func startMoving()
    {
        let actionWalk:SKAction = createActionWalk()
        
        run(actionWalk, withKey:kActionWalking)
    }
    
    private func resumeWalking()
    {
        guard
            
            let actionWalking:SKAction = action(forKey:kActionWalking)
            
        else
        {
            return
        }
        
        actionWalking.speed = 1
        startAnimating()
    }
    
    //MARK: public
    
    func startWalking()
    {
        startMoving()
        startAnimating()
    }
    
    func isSafe() -> Bool
    {
        if position.y > positionSafe
        {
            return true
        }
        
        return false
    }
    
    func stopWalking()
    {
        removeAction(forKey:kActionAnimate)
        
        guard
            
            let actionWalking:SKAction = action(forKey:kActionWalking)
            
        else
        {
            return
        }
        
        actionWalking.speed = 0
        
        let actionDelay:SKAction = SKAction.wait(forDuration:kStopDuration)
        let actionResume:SKAction = SKAction.run(resumeWalking)
        let actions:[SKAction] = [
            actionDelay,
            actionResume]
        let actionsSequence:SKAction = SKAction.sequence(actions)
        
        run(actionsSequence)
    }
}
