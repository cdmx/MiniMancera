import Foundation

class VOptionTamalesOaxaquenosFloorGullyEnd:ViewGameNode<MOptionTamalesOaxaquenos>
{
    override init(controller:ControllerGame<MOptionTamalesOaxaquenos>)
    {
        let texture:MGameTexture = controller.model.textures.gullyEnd
        
        super.init(
            controller:controller,
            texture:texture)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
