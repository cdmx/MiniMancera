import Foundation

class VOptionTamalesOaxaquenosFloorGullyStart:ViewGameNode<MOptionTamalesOaxaquenos>
{
    init(
        controller:ControllerGame<MOptionTamalesOaxaquenos>,
        model:MOptionTamalesOaxaquenosAreaFloorItemGroundProtocol)
    {
        let texture:MGameTexture = model.textureGround
        
        super.init(
            controller:controller,
            texture:texture)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
