import UIKit

class MOptionTamalesOaxaquenosAreaFactoryFloorStrategyInitial:MOptionTamalesOaxaquenosAreaFactoryFloorStrategyProtocol
{
    private(set) weak var model:MOptionTamalesOaxaquenosAreaFactoryFloor!
    private var left:Int
    private let kLength:Int = 10
    
    required init(model:MOptionTamalesOaxaquenosAreaFactoryFloor)
    {
        left = kLength
        self.model = model
    }
    
    func factoryItem(
        textures:MOptionTamalesOaxaquenosTextures,
        positionX:CGFloat) -> MOptionTamalesOaxaquenosAreaFloorItemProtocol
    {
        left -= 1
        
        if left < 0
        {
            model.strategyRegular()
        }
        
        let item:MOptionTamalesOaxaquenosAreaFloorItemProtocol = model.factoryItemGrass()
        
        return item
    }
}
