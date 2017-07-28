import Foundation

class VOptionTamalesOaxaquenosFloorGrass:ViewGameNode<MOptionTamalesOaxaquenos>
{
    init(controller:ControllerGame<MOptionTamalesOaxaquenos>,
         model:MOptionTamalesOaxaquenosAreaFloorItemGroundGrass)
    {
        let texture:MGameTexture = model.textureGrass
        
        super.init(
            controller:controller,
            texture:texture)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
