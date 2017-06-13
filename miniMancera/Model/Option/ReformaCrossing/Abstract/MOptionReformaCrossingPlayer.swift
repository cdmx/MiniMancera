import UIKit
import SpriteKit

class MOptionReformaCrossingPlayer:SKSpriteNode
{
    private weak var controller:COptionReformaCrossing!
    private let positionSafe:CGFloat
    private let kAddPointY:CGFloat = 200
    private let kSpeed:CGFloat = 35
    private let kActionWalking:String = "actionWalking"
    private let kAnimationPerFrame:TimeInterval = 0.2
    private let kZPosition:CGFloat = 0
    
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
    
    //MARK: public
    
    func startWalking()
    {
        let actionAnimate:SKAction = createActionAnimate()
        let actionWalk:SKAction = createActionWalk()
        let actions:[SKAction] = [
            actionAnimate,
            actionWalk]
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
        
    }
}
