import UIKit
import SpriteKit

class MOptionReformaCrossingBackground:SKSpriteNode
{
    private weak var model:MOptionReformaCrossing!
    private let kZPosition:CGFloat = -1
    
    init(model:MOptionReformaCrossing)
    {
        let texture:SKTexture = SKTexture(image:#imageLiteral(resourceName: "assetReformaCrossingBackground"))
        let textureSize:CGSize = texture.size()
        self.model = model
        
        super.init(texture:texture, color:UIColor.clear, size:textureSize)
        
        let sceneWidth:CGFloat = model.size.width
        let sceneHeight:CGFloat = model.size.height
        let sceneWidth_2:CGFloat = sceneWidth / 2.0
        let sceneHeight_2:CGFloat = sceneHeight / 2.0
        let centerPosition:CGPoint = CGPoint(x:sceneWidth_2, y:sceneHeight_2)
        position = centerPosition
        zPosition = kZPosition
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
