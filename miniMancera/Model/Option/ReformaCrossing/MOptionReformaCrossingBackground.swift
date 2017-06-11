import UIKit
import SpriteKit

class MOptionReformaCrossingBackground:SKSpriteNode
{
    init()
    {
        let texture:SKTexture = SKTexture(image:#imageLiteral(resourceName: "assetReformaCrossingBackground"))
        let size:CGSize = texture.size()
        
        super.init(texture:texture, color:UIColor.clear, size:size)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
