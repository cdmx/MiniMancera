import UIKit
import SpriteKit

class MOptionPollutedGardenBackground:SKSpriteNode
{
    private weak var controller:COptionPollutedGarden!
    private let kZPosition:CGFloat = -1
    
    init(controller:COptionPollutedGarden)
    {
        let texture:SKTexture = SKTexture(image:#imageLiteral(resourceName: "assetPollutedGardenBackground"))
        let textureSize:CGSize = texture.size()
        self.controller = controller
        
        super.init(texture:texture, color:UIColor.clear, size:textureSize)
        
        let sceneSize:CGSize = controller.model.size
        let sceneWidth:CGFloat = sceneSize.width
        let sceneWidth_2:CGFloat = sceneWidth / 2.0
        let centerPosition:CGPoint = CGPoint(x:sceneWidth_2, y:sceneHeight_2)
        position = centerPosition
        zPosition = kZPosition
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
