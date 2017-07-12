import SpriteKit

class VOptionWhistlesVsZombiesBackground:ViewGameNode<MOptionWhistlesVsZombies>
{
    override init(controller:ControllerGame<MOptionWhistlesVsZombies>)
    {
        let texture:MGameTexture = controller.model.textures.background
        
        super.init(
            controller:controller,
            texture:texture)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func positionStart()
    {
        guard
        
            let modelTexture:MGameTexture = self.modelTexture
        
        else
        {
            return
        }
        
        let sceneSize:CGSize = MGame.sceneSize
        let sceneWidth:CGFloat = sceneSize.height
        let width_2:CGFloat = modelTexture.width_2
        let height_2:CGFloat = modelTexture.height_2
        let positionX:CGFloat = -width_2 + sceneWidth
        position = CGPoint(x:positionX, y:height_2)
    }
}
