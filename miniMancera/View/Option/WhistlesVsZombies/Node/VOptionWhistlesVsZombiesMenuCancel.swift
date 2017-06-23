import SpriteKit

class VOptionWhistlesVsZombiesMenuCancel:SKSpriteNode
{
    private weak var controller:COptionWhistlesVsZombies!
    private let kAddPositionY:CGFloat = 50
    
    init(controller:COptionWhistlesVsZombies)
    {
        self.controller = controller
        
        let texture:SKTexture = SKTexture(image:#imageLiteral(resourceName: "assetWhistlesVsZombiesWhistleMenuCancel"))
        let textureSize:CGSize = texture.size()
        let sceneHeight:CGFloat = controller.model.size.height
        let sceneHeight_2:CGFloat = sceneHeight / 2.0
        let positionY:CGFloat = kAddPositionY - sceneHeight_2
        let position:CGPoint = CGPoint(x:0, y:positionY)
        
        super.init(texture:texture, color:UIColor.clear, size:textureSize)
        self.position = position
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
