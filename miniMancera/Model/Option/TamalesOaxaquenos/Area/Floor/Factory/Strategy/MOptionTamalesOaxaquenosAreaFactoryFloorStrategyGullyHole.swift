import UIKit

class MOptionTamalesOaxaquenosAreaFactoryFloorStrategyGullyHole:MOptionTamalesOaxaquenosAreaFactoryFloorStrategyProtocol
{
    private(set) weak var model:MOptionTamalesOaxaquenosAreaFactoryFloor!
    private(set) var counter:Int
    private let length:Int
    private let kLength:Int = 2
    
    required init(model:MOptionTamalesOaxaquenosAreaFactoryFloor)
    {
        self.model = model
        counter = 0
    }
    
    func factoryItem() -> MOptionTamalesOaxaquenosAreaFloorItemProtocol
    {
        counter += 1
        
        if counter > kLength
        {
            model.strategyGullyEnd()
        }
        
        let item:MOptionTamalesOaxaquenosAreaFloorItemGroundHill = model.factoryItemHill(
            height:height)
        
        return item
    }
}
