import UIKit

class VOptionTamalesOaxaquenosBackground:ViewGameNode<MOptionTamalesOaxaquenos>
{
    override init(controller:ControllerGame<MOptionTamalesOaxaquenos>)
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
        
        let sceneHeight:CGFloat = MGame.sceneSize.height
        let sceneHeight_2:CGFloat = sceneHeight / 2.0
        let height_2:CGFloat = modelTexture.height_2
        let positionY:CGFloat = sceneHeight_2 + height_2
        position = CGPoint(x:0, y:positionY)
    }
}
