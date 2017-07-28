import UIKit

protocol MOptionTamalesOaxaquenosAreaFactoryFloorStrategyProtocol
{
    init(model:MOptionTamalesOaxaquenosAreaFactoryFloor)
    
    weak var model:MOptionTamalesOaxaquenosAreaFactoryFloor! { get }
    
    func factoryItem() -> MOptionTamalesOaxaquenosAreaFloorItemProtocol
}
