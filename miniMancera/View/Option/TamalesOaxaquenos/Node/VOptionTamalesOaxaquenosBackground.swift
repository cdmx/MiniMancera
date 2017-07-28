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
        
        let height_2:CGFloat = modelTexture.height_2
        position = CGPoint(x:0, y:height_2)
    }
}
