import UIKit
import SpriteKit

class MOptionReformaCrossingFoe:SKSpriteNode
{
    class func randomFoe(
        lane:MOptionReformaCrossingLaneProtocol,
        sceneSize:CGSize) -> MOptionReformaCrossingFoe
    {
        let foe:MOptionReformaCrossingFoe = MOptionReformaCrossingFoe(
            lane:lane,
            sceneSize:sceneSize)
        
        return foe
    }
    
    init(lane:MOptionReformaCrossingLaneProtocol, sceneSize:CGSize)
    {
        let texture:SKTexture = SKTexture(image:#imageLiteral(resourceName: "assetReformaCrossingVW"))
        let size:CGSize = texture.size()
        
        super.init(texture:texture, color:UIColor.clear, size:size)
        position = lane.foeInitialPoint(
            foe:self,
            sceneSize:sceneSize)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
