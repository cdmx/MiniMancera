import UIKit
import SpriteKit

class MOptionReformaCrossingFoe:SKSpriteNode
{
    private let kSpeed:CGFloat = 30
    
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
        
        let distance:CGFloat = abs(startingPoint.x - endingPoint.x)
        let translationTime:CGFloat = distance / kSpeed
        let translationTimeInterval:TimeInterval = TimeInterval(translationTime)
        
        position = startingPoint
        
        let actionMove:SKAction = SKAction.move(
            to:endingPoint,
            duration:translationTimeInterval)
        let actionExit:SKAction = SKAction.removeFromParent()
        let actions:[SKAction] = [
            actionMove,
            actionExit]
        let actionsSequence:SKAction = SKAction.sequence(actions)
        
        run(actionsSequence)
    }
}
