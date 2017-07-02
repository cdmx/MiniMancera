import UIKit

class VOptionPollutedGardenBackground:ViewGameNode<MOptionPollutedGarden>
{
    override init(controller:ControllerGame<MOptionPollutedGarden>)
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
            
            let modelTexture:MGameTexture = modelTexture
            
        else
        {
            return
        }
        
        let textureHeight:CGFloat = modelTexture.height
        let sceneSize:CGSize = MGame.sceneSize
        let sceneWidth:CGFloat = sceneSize.width
        let sceneHeight:CGFloat = sceneSize.height
        let sceneWidth_2:CGFloat = sceneWidth / 2.0
        let sceneHeight_2:CGFloat = sceneHeight / 2.0
        let deltaHeight:CGFloat = textureHeight - sceneHeight
        let deltaHeight_2:CGFloat = deltaHeight / 2.0
        let positionY:CGFloat = deltaHeight_2 + sceneHeight_2
        let centerPosition:CGPoint = CGPoint(x:sceneWidth_2, y:positionY)
        position = centerPosition
    }
}
