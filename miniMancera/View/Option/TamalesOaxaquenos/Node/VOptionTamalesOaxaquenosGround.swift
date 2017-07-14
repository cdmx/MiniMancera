import Foundation

class VOptionTamalesOaxaquenosGround:ViewGameNode<MOptionTamalesOaxaquenos>
{
    init(
        controller:ControllerGame<MOptionTamalesOaxaquenos>,
        model:MOptionTamalesOaxaquenosAreaItemGroundProtocol)
    {
        let texture:MGameTexture = model.texture
        
        super.init(
            controller:controller,
            texture:texture)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
