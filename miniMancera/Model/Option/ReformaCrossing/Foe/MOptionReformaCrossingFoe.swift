import UIKit
import SpriteKit

class MOptionReformaCrossingFoe:SKSpriteNode, MOptionReformaCrossingFoeProtocol
{
    private weak var model:MOptionReformaCrossing!
    private let kMinSpeed:CGFloat = 10
    
    class func randomFoe(
        lane:MOptionReformaCrossingLaneProtocol,
        model:MOptionReformaCrossing) -> MOptionReformaCrossingFoe
    {
        let foe:MOptionReformaCrossingFoe = MOptionReformaCrossingFoe(
            lane:lane,
            model:model)
        
        return foe
    }
    
    init(lane:MOptionReformaCrossingLaneProtocol, model:MOptionReformaCrossing)
    {
        let texture:SKTexture = SKTexture(image:#imageLiteral(resourceName: "assetReformaCrossingVW"))
        let size:CGSize = texture.size()
        self.model = model
        
        super.init(texture:texture, color:UIColor.clear, size:size)
        movement(lane:lane, model:model)
        scale(lane:lane)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: private
    
    private func scale(lane:MOptionReformaCrossingLaneProtocol)
    {
        xScale = xScale * lane.scaleHorizontal
    }
    
    private func movement(lane:MOptionReformaCrossingLaneProtocol, model:MOptionReformaCrossing)
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
        let actionExit:SKAction = SKAction.removeFromParent()
        let actions:[SKAction] = [
            actionMove,
            actionExit]
        let actionsSequence:SKAction = SKAction.sequence(actions)
        
        run(actionsSequence)
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
    
    //MARK: foe protocol
    
    var randomMaxSpeed:UInt32
    {
        get
        {
            return 0
        }
    }
}
