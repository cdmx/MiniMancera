import UIKit
import SpriteKit

class MOptionReformaCrossingBackground:SKSpriteNode
{
    init(size:CGSize)
    {
        let texture:SKTexture = SKTexture(image:#imageLiteral(resourceName: "assetReformaCrossingBackground"))
        let textureSize:CGSize = texture.size()
        
        super.init(texture:texture, color:UIColor.clear, size:size)
        zPosition = -1
        
        let width:CGFloat = textureSize.width
        let height:CGFloat = textureSize.height
        let screenWidth:CGFloat = size.width
        let screenHeight:CGFloat = size.height
        let screenWidth_2:CGFloat = screenWidth / 2.0
        let screenHeight_2:CGFloat = screenHeight / 2.0
        let centerPosition:CGPoint = CGPoint(x:screenWidth_2, y:screenHeight_2)
        position = centerPosition
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
