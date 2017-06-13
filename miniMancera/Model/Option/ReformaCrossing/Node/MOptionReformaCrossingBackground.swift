import UIKit
import SpriteKit

class MOptionReformaCrossingBackground:SKSpriteNode
{
    private weak var controller:COptionReformaCrossing!
    private let kZPosition:CGFloat = -1
    
    init(controller:COptionReformaCrossing)
    {
        let texture:SKTexture = SKTexture(image:#imageLiteral(resourceName: "assetReformaCrossingBackground"))
        let textureSize:CGSize = texture.size()
        self.controller = controller
        
        super.init(texture:texture, color:UIColor.clear, size:textureSize)
        
        let sceneSize:CGSize = controller.model.size
        let sceneWidth:CGFloat = sceneSize.width
        let sceneHeight:CGFloat = sceneSize.height
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
