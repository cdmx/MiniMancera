import UIKit

class MOptionTamalesOaxaquenosAreaFactoryFloor
{
    private(set) var items:[MOptionTamalesOaxaquenosAreaFloorItemProtocol]
    private(set) var strategy:MOptionTamalesOaxaquenosAreaFactoryFloorStrategyProtocol!
    private let itemWidth_2:CGFloat
    private let maxPositionX:CGFloat
    private let kItemWidth:CGFloat = 32
    
    init()
    {
        items = []
        itemWidth_2 = kItemWidth / 2.0
        maxPositionX = MOptionTamalesOaxaquenosArea.kAreaWidth + itemWidth_2
        strategy = MOptionTamalesOaxaquenosAreaFactoryFloorStrategyInitial(
            model:self)
    }
    
    //MARK: public
    
    func floorItems(
        textures:MOptionTamalesOaxaquenosTextures) -> [MOptionTamalesOaxaquenosAreaFloorItemProtocol]
    {
        var positionX:CGFloat = itemWidth_2
        
        while positionX < maxPositionX
        {
            let item:MOptionTamalesOaxaquenosAreaFloorItemProtocol = strategy.factoryItem(
                textures:textures,
                positionX:positionX)
            
            items.append(item)
            positionX += kItemWidth
        }
        
        return items
    }
    
    func strategyRegular()
    {
        
    }
    
    func strategyHill()
    {
        
    }
    
    func strategyGully()
    {
        
    }
    
    func stratgyFinal()
    {
        
    }
    
    func factoryItemGrass() -> MOptionTamalesOaxaquenosAreaFloorItemGroundGrass
    {
        
    }
    
    func factoryItemHill() -> MOptionTamalesOaxaquenosAreaFloorItemGroundHill
    {
        
    }
}
