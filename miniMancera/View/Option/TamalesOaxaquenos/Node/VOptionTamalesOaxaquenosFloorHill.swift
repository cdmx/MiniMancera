import Foundation

class VOptionTamalesOaxaquenosFloorHill:ViewGameNode<MOptionTamalesOaxaquenos>
{
    init(controller:ControllerGame<MOptionTamalesOaxaquenos>,
         model:MOptionTamalesOaxaquenosAreaFloorItemGroundHill)
    {
        let texture:MGameTexture = model.textureHill
        
        super.init(
            controller:controller,
            texture:texture)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
