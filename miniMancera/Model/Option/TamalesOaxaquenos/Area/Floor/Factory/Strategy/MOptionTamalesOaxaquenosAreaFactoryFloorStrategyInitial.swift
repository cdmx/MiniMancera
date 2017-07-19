import UIKit

class MOptionTamalesOaxaquenosAreaFactoryFloorStrategyInitial:MOptionTamalesOaxaquenosAreaFactoryFloorStrategyProtocol
{
    private(set) weak var model:MOptionTamalesOaxaquenosAreaFactoryFloor!
    private let kMinLength:CGFloat = 768
    
    required init(model:MOptionTamalesOaxaquenosAreaFactoryFloor)
    {
        self.model = model
    }
    
    func factoryItem() -> MOptionTamalesOaxaquenosAreaFloorItemProtocol
    {
        if model.currentPositionX > kMinLength
        {
            model.strategyRegular()
        }
        
        let item:MOptionTamalesOaxaquenosAreaFloorItemGroundGrass = model.factoryItemGrass()
        
        return item
    }
}
