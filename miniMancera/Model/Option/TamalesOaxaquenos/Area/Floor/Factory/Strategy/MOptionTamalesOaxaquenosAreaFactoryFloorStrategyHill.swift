import UIKit

class MOptionTamalesOaxaquenosAreaFactoryFloorStrategyHill:MOptionTamalesOaxaquenosAreaFactoryFloorStrategyProtocol
{
    private(set) weak var model:MOptionTamalesOaxaquenosAreaFactoryFloor!
    private(set) var counter:Int
    private let height:CGFloat
    private let length:Int
    private let kLengthRatio:UInt32 = 5
    private let kHeightRatio:UInt32 = 30
    
    required init(model:MOptionTamalesOaxaquenosAreaFactoryFloor)
    {
        self.model = model
        counter = 0
        
        let randomLength:UInt32 = arc4random_uniform(kLengthRatio)
        length = Int(randomLength)
        
        let randomHeight:UInt32 = arc4random_uniform(kHeightRatio)
        height = CGFloat(randomHeight)
    }
    
    func factoryItem() -> MOptionTamalesOaxaquenosAreaFloorItemProtocol
    {
        counter += 1
        
        if counter < length
        {
            model.strategyRegular()
        }
        
        let item:MOptionTamalesOaxaquenosAreaFloorItemGroundHill = model.factoryItemHill(
            height:height)
        
        return item
    }
}
