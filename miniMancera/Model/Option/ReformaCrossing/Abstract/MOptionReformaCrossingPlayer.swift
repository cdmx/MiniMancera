import UIKit
import SpriteKit

class MOptionReformaCrossingPlayer:SKSpriteNode
{
    let positionSafe:CGFloat
    private weak var model:MOptionReformaCrossing!
    private let kAddPointY:CGFloat = 200
    private let kSpeed:CGFloat = 20
    private let kActionWalking:String = "actionWalking"
    private let kAnimationPerFrame:TimeInterval = 0.3
    
    init(model:MOptionReformaCrossing)
    {
        let texture:SKTexture = SKTexture(image:#imageLiteral(resourceName: "assetReformaCrossingPlayer0"))
        let size:CGSize = texture.size()
        let sceneHeight_2:CGFloat = model.size.height / 2.0
        let height_2:CGFloat = size.height / 2.0
        positionSafe = sceneHeight_2 + height_2 + kAddPointY
        self.model = model
        
        super.init(texture:texture, color:UIColor.clear, size:size)
        position = startPosition()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: private
    
    private func startPosition() -> CGPoint
    {
        let sceneWidth_2:CGFloat = model.size.width / 2.0
        let height_2:CGFloat = size.height / 2.0
        let point:CGPoint = CGPoint(x:sceneWidth_2, y:height_2)
        
        return point
    }
    
    private func finalPosition() -> CGPoint
    {
        let sceneWidth_2:CGFloat = model.size.width / 2.0
        let sceneHeight:CGFloat = model.size.height
        let height_2:CGFloat = size.height / 2.0
        let positionY:CGFloat = sceneHeight + height_2
        let point:CGPoint = CGPoint(x:sceneWidth_2, y:positionY)
        
        return point
    }
    
    private func createActionAnimate() -> SKAction
    {
        let textureWalkingA:SKTexture = SKTexture(image:#imageLiteral(resourceName: "assetReformaCrossingPlayer1"))
        let textureWalkingB:SKTexture = SKTexture(image:#imageLiteral(resourceName: "assetReformaCrossingPlayer2"))
        let textures:[SKTexture] = [
            textureWalkingA,
            textureWalkingB]
        
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
}
