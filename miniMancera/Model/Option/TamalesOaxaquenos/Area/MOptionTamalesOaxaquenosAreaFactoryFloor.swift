import UIKit

extension MOptionTamalesOaxaquenosArea
{
    private static let kItemWidth:CGFloat = 32
    
    class func factoryFloorItems(
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
    
    private class func factoryItem(
        textures:MOptionTamalesOaxaquenosTextures,
        positionX:CGFloat) -> MOptionTamalesOaxaquenosAreaFloorItemProtocol
    {
        let item:MOptionTamalesOaxaquenosAreaFloorItemProtocol = factoryGroundItem(
            textures:textures,
            positionX:positionX)
        
        return item
    }
}
