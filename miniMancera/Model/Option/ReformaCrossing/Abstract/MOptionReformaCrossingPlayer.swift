import UIKit
import SpriteKit

class MOptionReformaCrossingPlayer:SKSpriteNode
{
    private weak var controller:COptionReformaCrossing!
    private var lastElapsedTime:TimeInterval
    private var stopTime:TimeInterval?
    private let stopTextures:[SKTexture]
    private let positionSafe:CGFloat
    private let kAddPointY:CGFloat = 200
    private let kSpeed:CGFloat = 35
    private let kActionWalking:String = "actionWalking"
    private let kAnimationPerFrame:TimeInterval = 0.2
    private let kStopAnimationPerFrame:TimeInterval = 0.1
    private let kZPosition:CGFloat = 0
    private let kStopDuration:TimeInterval = 1
    
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
        let sceneHeight_2:CGFloat = controller.model.size.height / 2.0
        let height_2:CGFloat = size.height / 2.0
        positionSafe = sceneHeight_2 + height_2 + kAddPointY
        lastElapsedTime = 0
        
        super.init(texture:texture, color:UIColor.clear, size:size)
        position = startPosition()
        zPosition = kZPosition
        isHidden = true
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
        
        return actionWalk
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
}
