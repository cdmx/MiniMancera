import UIKit
import SpriteKit

class MOptionReformaCrossingBackground:SKSpriteNode
{
    private let kZPosition:CGFloat = -1
    
    init(size:CGSize)
    {
        let texture:SKTexture = SKTexture(image:#imageLiteral(resourceName: "assetReformaCrossingBackground"))
        let textureSize:CGSize = texture.size()
        
        super.init(texture:texture, color:UIColor.clear, size:textureSize)
        
        let screenWidth:CGFloat = size.width
        let screenHeight:CGFloat = size.height
        let screenWidth_2:CGFloat = screenWidth / 2.0
        let screenHeight_2:CGFloat = screenHeight / 2.0
        let centerPosition:CGPoint = CGPoint(x:screenWidth_2, y:screenHeight_2)
        position = centerPosition
        zPosition = kZPosition
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
