import UIKit

class MOptionTamalesOaxaquenosAreaFloorItemGroundHill:MOptionTamalesOaxaquenosAreaFloorItemGroundProtocol
{
    private(set) weak var textureGround:MGameTexture!
    private(set) weak var textureHill:MGameTexture!
    private(set) var positionX:CGFloat
    
    init(
        textureGround:MGameTexture,
        textureHill:MGameTexture,
        positionX:CGFloat)
    {
        self.textureGround = textureGround
        self.textureHill = textureHill
        self.positionX = positionX
    }
    
    func factoryNode(controller:ControllerGame<MOptionTamalesOaxaquenos>) -> ViewGameNode<MOptionTamalesOaxaquenos>?
    {
        let node:VOptionTamalesOaxaquenosFloorGroundHill = VOptionTamalesOaxaquenosFloorGroundHill(
            controller:controller,
            model:self)
        
        return node
    }
}
