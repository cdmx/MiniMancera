import UIKit

class MOptionTamalesOaxaquenosAreaFactoryFloor
{
    private(set) var strategy:MOptionTamalesOaxaquenosAreaStrategy?
    private let kItemWidth:CGFloat = 32
    
    //MARK: public
    
    func floorItems(
        textures:MOptionTamalesOaxaquenosTextures) -> [MOptionTamalesOaxaquenosAreaFloorItemProtocol]
    {
        var items:[MOptionTamalesOaxaquenosAreaFloorItemProtocol] = []
        let itemWidth_2:CGFloat = kItemWidth / 2.0
        let maxPositionX:CGFloat = kAreaWidth + itemWidth_2
        var positionX:CGFloat = itemWidth_2
        
        while positionX < maxPositionX
        {
            let item:MOptionTamalesOaxaquenosAreaFloorItemProtocol = factoryItem(
                textures:textures,
                positionX:positionX)
            items.append(item)
            
            positionX += kItemWidth
        }
        
        return items
    }
    
    //MARK: private
    
    
}
