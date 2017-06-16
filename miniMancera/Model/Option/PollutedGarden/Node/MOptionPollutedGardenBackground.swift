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
        
        let textureHeight:CGFloat = textureSize.height
        let sceneSize:CGSize = controller.model.size
        let sceneWidth:CGFloat = sceneSize.width
        let sceneHeight:CGFloat = sceneSize.height
        let sceneHeight_2:CGFloat = sceneHeight / 2.0
        let sceneWidth_2:CGFloat = sceneWidth / 2.0
        let deltaHeight:CGFloat = textureHeight - sceneHeight
        let deltaHeight_2:CGFloat = deltaHeight / 2.0
        let positionY:CGFloat = deltaHeight_2 + sceneHeight_2
        let centerPosition:CGPoint = CGPoint(x:sceneWidth_2, y:positionY)
        position = centerPosition
        zPosition = kZPosition
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
