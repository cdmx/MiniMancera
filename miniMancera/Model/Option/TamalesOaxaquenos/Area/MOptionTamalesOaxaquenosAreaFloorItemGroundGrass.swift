import UIKit

class MOptionTamalesOaxaquenosAreaFloorItemGroundGrass:MOptionTamalesOaxaquenosAreaFloorItemGroundProtocol
{
    private(set) weak var textureGround:MGameTexture!
    private(set) weak var textureGrass:MGameTexture!
    private(set) var positionX:CGFloat
    
    init(
        textureGround:MGameTexture,
        textureGrass:MGameTexture,
        positionX:CGFloat)
    {
        self.textureGround = textureGround
        self.textureGrass = textureGrass
        self.positionX = positionX
    }
    
    func factoryNode(controller:ControllerGame<MOptionTamalesOaxaquenos>) -> ViewGameNode<MOptionTamalesOaxaquenos>?
    {
        let node:VOptionTamalesOaxaquenosFloorGroundGrass = VOptionTamalesOaxaquenosFloorGroundGrass(
            controller:controller,
            model:self)
        
        return node
    }
}
