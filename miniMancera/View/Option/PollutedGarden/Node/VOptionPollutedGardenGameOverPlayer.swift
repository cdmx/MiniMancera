import UIKit

class VOptionPollutedGardenGameOverPlayer:ViewGameNode<MOptionPollutedGarden>
{
    override init(controller:ControllerGame<MOptionPollutedGarden>)
    {
        let texture:MGameTexture = controller.model.textures.playerDefeated
        
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
        let sceneSize:CGSize = MGame.sceneSize
        let width_2:CGFloat = sceneSize.width / 2.0
        let height_2:CGFloat = sceneSize.height / 2.0
        
        position = CGPoint(x:width_2, y:height_2)
    }
}
