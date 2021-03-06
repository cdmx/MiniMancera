import UIKit

class MOptionTamalesOaxaquenosAreaFactoryFloorStrategyGullyEnd:MOptionTamalesOaxaquenosAreaFactoryFloorStrategyProtocol
{
    private(set) weak var model:MOptionTamalesOaxaquenosAreaFactoryFloor!
    
    required init(model:MOptionTamalesOaxaquenosAreaFactoryFloor)
    {
        self.model = model
    }
    
    func factoryItem() -> MOptionTamalesOaxaquenosAreaFloorItemProtocol
    {
        model.strategyRegular()
        
        let item:MOptionTamalesOaxaquenosAreaFloorItemGroundGullyEnd = model.factoryItemGullyEnd()
        
        return item
    }
}
