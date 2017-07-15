import UIKit

class MOptionTamalesOaxaquenosAreaItemGroundGrass:MOptionTamalesOaxaquenosAreaItemGroundProtocol
{
    private(set) weak var texture:MGameTexture!
    private(set) var positionX:CGFloat
    
    init(texture:MGameTexture, positionX:CGFloat)
    {
        self.texture = texture
        self.positionX = positionX
    }
    
    func factoryNode(controller:COptionTamalesOaxaquenos) -> ViewGameNode<MOptionTamalesOaxaquenos>?
    {
        let node:VOptionTamalesOaxaquenosGroundGrass = VOptionTamalesOaxaquenosGroundGrass(
            controller:controller,
            model:self)
        
        return node
    }
}
