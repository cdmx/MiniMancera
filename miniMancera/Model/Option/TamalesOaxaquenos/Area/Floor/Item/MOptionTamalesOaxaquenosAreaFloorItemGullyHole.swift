import UIKit

class MOptionTamalesOaxaquenosAreaFloorItemGullyHole:MOptionTamalesOaxaquenosAreaFloorItemProtocol
{
    private(set) var positionX:CGFloat
    
    init(positionX:CGFloat)
    {
        self.positionX = positionX
    }
    
    func factoryNode(controller:ControllerGame<MOptionTamalesOaxaquenos>) -> ViewGameNode<MOptionTamalesOaxaquenos>?
    {
        return nil
    }
}
