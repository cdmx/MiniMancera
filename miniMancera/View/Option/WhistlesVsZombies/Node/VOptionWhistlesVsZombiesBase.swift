import SpriteKit

class VOptionWhistlesVsZombiesBase:SKSpriteNode
{
    private weak var controller:COptionWhistlesVsZombies!
    private weak var model:MOptionWhistlesVsZombiesBaseItem!
    
    init(
        controller:COptionWhistlesVsZombies,
        model:MOptionWhistlesVsZombiesBaseItem)
    {
        self.controller = controller
        self.model = model
        
        let base:MOptionWhistlesVsZombiesBase = controller.model.base
        
        super.init(
            texture:base.texture,
            color:UIColor.clear,
            size:base.textureSize)
        zPosition = MOptionWhistlesVsZombiesZPosition.Base.rawValue
        position = CGPoint(x:model.positionX, y:model.positionY)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
