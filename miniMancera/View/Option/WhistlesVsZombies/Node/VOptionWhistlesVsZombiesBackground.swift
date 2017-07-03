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
        let sceneWidth:CGFloat = sceneSize.width
        let sceneHeight:CGFloat = sceneSize.height
        let sceneWidth_2:CGFloat = sceneWidth / 2.0
        let height_2:CGFloat = modelTexture.height_2
        let positionY:CGFloat = sceneHeight - height_2
        position = CGPoint(x:sceneWidth_2, y:positionY)
    }
}
