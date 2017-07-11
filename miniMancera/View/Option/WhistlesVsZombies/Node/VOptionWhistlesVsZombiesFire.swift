import UIKit

class VOptionWhistlesVsZombiesFire:ViewGameNode<MOptionWhistlesVsZombies>
{
    private let kPositionX:CGFloat = 300
    private let kPositionY:CGFloat = 45
    
    override init(controller:ControllerGame<MOptionWhistlesVsZombies>)
    {
        let texture:MGameTexture = controller.model.textures.fire
        
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
        let sceneHeight:CGFloat = MGame.sceneSize.width
        let positionY:CGFloat = sceneHeight - kPositionY
        position = CGPoint(x:kPositionX, y:positionY)
    }
}
