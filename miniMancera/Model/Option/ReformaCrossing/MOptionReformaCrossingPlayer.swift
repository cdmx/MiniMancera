import UIKit
import SpriteKit

class MOptionReformaCrossingPlayer:SKSpriteNode
{
    init()
    {
        let texture:SKTexture = SKTexture(image:#imageLiteral(resourceName: "assetReformaCrossingPlayer0"))
        let size:CGSize = texture.size()
        
        super.init(texture:texture, color:UIColor.clear, size:size)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
