import UIKit

class MOptionTamalesOaxaquenosAreaFloorItemGroundGullyEnd:MOptionTamalesOaxaquenosAreaFloorItemGroundProtocol
{
    let hillHeight:CGFloat
    private(set) weak var textureGround:MGameTexture!
    private(set) weak var textureHill:MGameTexture!
    private(set) var positionX:CGFloat
    
    init(
        textureGround:MGameTexture,
        textureHill:MGameTexture,
        hillHeight:CGFloat,
        positionX:CGFloat)
    {
        self.textureGround = textureGround
        self.textureHill = textureHill
        self.hillHeight = hillHeight
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
