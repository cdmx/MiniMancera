import UIKit

class MOptionTamalesOaxaquenosAreaFloorItemGroundGullyStart:MOptionTamalesOaxaquenosAreaFloorItemProtocol
{
    private(set) weak var textureGround:MGameTexture!
    private(set) var positionX:CGFloat
    
    init(
        textureGround:MGameTexture,
        positionX:CGFloat)
    {
        self.textureGround = textureGround
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
