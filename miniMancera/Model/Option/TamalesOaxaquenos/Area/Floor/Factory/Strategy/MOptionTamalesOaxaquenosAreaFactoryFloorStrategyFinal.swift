import UIKit

class MOptionTamalesOaxaquenosAreaFactoryFloorStrategyFinal:MOptionTamalesOaxaquenosAreaFactoryFloorStrategyProtocol
{
    private(set) weak var model:MOptionTamalesOaxaquenosAreaFactoryFloor!
    
    required init(model:MOptionTamalesOaxaquenosAreaFactoryFloor)
    {
        self.model = model
    }
    
    func factoryItem() -> MOptionTamalesOaxaquenosAreaFloorItemProtocol
    {
        let item:MOptionTamalesOaxaquenosAreaFloorItemGroundGrass = model.factoryItemGrass()
        
        return item
    }
}
