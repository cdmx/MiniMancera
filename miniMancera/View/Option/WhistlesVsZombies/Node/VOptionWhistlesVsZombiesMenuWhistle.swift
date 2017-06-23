import SpriteKit

class VOptionWhistlesVsZombiesMenuWhistle:SKSpriteNode
{
    private weak var controller:COptionWhistlesVsZombies!
    private weak var model:MOptionWhistlesVsZombiesMenuItem!
    
    init(controller:COptionWhistlesVsZombies, model:MOptionWhistlesVsZombiesMenuItem)
    {
        self.controller = controller
        self.model = model
        
        super.init(texture:model.texture, color:UIColor.clear, size:model.textureSize)
        position = CGPoint(x:model.positionX, y:model.positionY)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
