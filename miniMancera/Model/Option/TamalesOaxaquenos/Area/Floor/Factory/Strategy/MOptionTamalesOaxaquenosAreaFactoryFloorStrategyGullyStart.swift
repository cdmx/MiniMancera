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
        model.strategyGullyHole()
        
        let item:MOptionTamalesOaxaquenosAreaFloorItemGroundGullyStart = model.factoryItemGullyStart()
        
        return item
    }
}
