import UIKit

protocol MOptionTamalesOaxaquenosAreaFactoryFloorStrategyProtocol
{
    init(model:MOptionTamalesOaxaquenosAreaFactoryFloor)
    
    var model:MOptionTamalesOaxaquenosAreaFactoryFloor! { get }
    
    func factoryItem(
        textures:MOptionTamalesOaxaquenosTextures,
        positionX:CGFloat) -> MOptionTamalesOaxaquenosAreaFloorItemProtocol
}
