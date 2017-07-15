import Foundation

class VOptionTamalesOaxaquenosGrass:ViewGameNode<MOptionTamalesOaxaquenos>
{
    init(controller:ControllerGame<MOptionTamalesOaxaquenos>,
         model:MOptionTamalesOaxaquenosAreaItemGroundGrass)
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
