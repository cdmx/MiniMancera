import UIKit
import SpriteKit

class MOptionReformaCrossingFoe:SKSpriteNode
{
    init()
    {
        let texture:SKTexture = SKTexture(image:#imageLiteral(resourceName: "assetReformaCrossingVW"))
        let size:CGSize = texture.size()
        
        super.init(texture:texture, color:UIColor.clear, size:size)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
