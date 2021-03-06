import UIKit

class MOptionTamalesOaxaquenosAreaFloorItemGroundGullyEnd:MOptionTamalesOaxaquenosAreaFloorItemGroundProtocol
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
        let node:VOptionTamalesOaxaquenosFloorGroundGullyEnd = VOptionTamalesOaxaquenosFloorGroundGullyEnd(
            controller:controller,
            model:self)
        
        return node
    }
}
