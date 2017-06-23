import SpriteKit

class VOptionWhistlesVsZombiesMenuCancel:SKSpriteNode
{
    private weak var controller:COptionWhistlesVsZombies!
    private let kPositionY:CGFloat = 100
    
    init(controller:COptionWhistlesVsZombies)
    {
        self.controller = controller
        
        let texture:SKTexture = SKTexture(image:#imageLiteral(resourceName: "assetWhistlesVsZombiesWhistleMenuCancel"))
        let textureSize:CGSize = texture.size()
        let sceneWidth:CGFloat = controller.model.size.width
        let sceneWidth_2:CGFloat = sceneWidth / 2.0
        let position:CGPoint = CGPoint(x:sceneWidth_2, y:kPositionY)
        
        super.init(texture:texture, color:UIColor.clear, size:textureSize)
        self.position = position
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
