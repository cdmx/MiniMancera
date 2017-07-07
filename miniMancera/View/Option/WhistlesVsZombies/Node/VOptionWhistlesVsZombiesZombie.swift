import UIKit

class VOptionWhistlesVsZombiesZombie:ViewGameNode<MOptionWhistlesVsZombies>
{
    private weak var model:MOptionWhistlesVsZombiesZombieItem?
    
    init(
        controller:ControllerGame<MOptionWhistlesVsZombies>,
        model:MOptionWhistlesVsZombiesZombieItem)
    {
        self.model = model
        
        super.init(
            controller:controller,
            texture:model.type.textureStand)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func positionStart()
    {
        guard
        
            let model:MOptionWhistlesVsZombiesZombieItem = self.model,
            let modelTexture:MGameTexture = self.modelTexture
        
        else
        {
            return
        }
        
        let sceneWidth:CGFloat = MGame.sceneSize.height
        let width_2:CGFloat = modelTexture.width_2
        let positionX:CGFloat = sceneWidth - width_2
        let positionY:CGFloat = model.lane.positionY
        position = CGPoint(x:positionX, y:positionY)
    }
}
