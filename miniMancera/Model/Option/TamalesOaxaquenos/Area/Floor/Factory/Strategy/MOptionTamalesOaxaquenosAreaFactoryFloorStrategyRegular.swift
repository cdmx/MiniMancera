import UIKit

class MOptionTamalesOaxaquenosAreaFactoryFloorStrategyRegular:MOptionTamalesOaxaquenosAreaFactoryFloorStrategyProtocol
{
    private(set) weak var model:MOptionTamalesOaxaquenosAreaFactoryFloor!
    private let kRandomRange:UInt32 = 100
    private let kRandomMaxHill:UInt32 = 10
    private let kRandomMaxGully:UInt32 = 15
    
    required init(model:MOptionTamalesOaxaquenosAreaFactoryFloor)
    {
        self.model = model
    }
    
    func factoryItem() -> MOptionTamalesOaxaquenosAreaFloorItemProtocol
    {
        if model.currentPositionX > model.finalLine
        {
            model.strategyFinal()
        }
        else
        {
            randomize()
        }
        
        let item:MOptionTamalesOaxaquenosAreaFloorItemGroundGrass = model.factoryItemGrass()
        
        return item
    }
    
    //MARK: private
    
    private func randomize()
    {
        let random:UInt32 = arc4random_uniform(kRandomRange)
        
        if random < kRandomMaxHill
        {
            model.strategyHill()
        }
        else if random < kRandomMaxGully
        {
            model.strategyGullyStart()
        }
    }
}
