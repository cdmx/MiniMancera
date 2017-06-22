import SpriteKit

class VOptionWhistlesVsZombiesBackground:SKSpriteNode
{
    private weak var controller:COptionWhistlesVsZombies!
    private let kZPosition:CGFloat = -10
    
    init(controller:COptionWhistlesVsZombies)
    {
        let texture:SKTexture = SKTexture(image:#imageLiteral(resourceName: "assetWhistlesVsZombiesBackground"))
        let textureSize:CGSize = texture.size()
        self.controller = controller
        
        super.init(texture:texture, color:UIColor.clear, size:textureSize)
        
        let textureHeight:CGFloat = textureSize.height
        let textureHeight_2:CGFloat = textureHeight / 2.0
        let sceneSize:CGSize = controller.model.size
        let sceneWidth:CGFloat = sceneSize.width
        let sceneHeight:CGFloat = sceneSize.height
        let sceneHeight_2:CGFloat = sceneHeight / 2.0
        let sceneWidth_2:CGFloat = sceneWidth / 2.0
        let positionY:CGFloat = sceneHeight_2 - textureHeight_2
        let centerPosition:CGPoint = CGPoint(x:sceneWidth_2, y:positionY)
        position = centerPosition
        zPosition = kZPosition
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
