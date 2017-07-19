import UIKit

class MOptionTamalesOaxaquenosAreaFactoryFloorStrategyGullyStart:MOptionTamalesOaxaquenosAreaFactoryFloorStrategyProtocol
{
    private(set) weak var model:MOptionTamalesOaxaquenosAreaFactoryFloor!
    
    required init(model:MOptionTamalesOaxaquenosAreaFactoryFloor)
    {
        self.model = model
    }
    
    func factoryItem() -> MOptionTamalesOaxaquenosAreaFloorItemProtocol
    {
        
        
        let item:MOptionTamalesOaxaquenosAreaFloorItemGroundHill = model.factoryItemHill()
        
        return item
    }
}
