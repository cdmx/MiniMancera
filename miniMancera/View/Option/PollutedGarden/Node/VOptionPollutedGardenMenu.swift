import UIKit

class VOptionPollutedGardenMenu:ViewGameNode<MOptionPollutedGarden>
{
    private let kMargin:CGFloat = 45
    
    override init(controller:ControllerGame<MOptionPollutedGarden>)
    {
        let texture:MGameTexture = controller.model.textures.menu
        
        super.init(
            controller:controller,
            texture:texture)
        isUserInteractionEnabled = true
        alpha = 0
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func positionStart()
    {
        guard
            
            let modelTexture:MGameTexture = modelTexture
            
        else
        {
            return
        }
        
        let sceneHeight:CGFloat = MGame.sceneSize.height
        let width_2:CGFloat = modelTexture.width_2
        let positionY:CGFloat = sceneHeight - kMargin
        position = CGPoint(x:width_2, y:positionY)
    }
    
    override func touchesEnded(_ touches:Set<UITouch>, with event:UIEvent?)
    {
        controller.showMenu()
    }
}
