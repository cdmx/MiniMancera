import UIKit

extension MOptionTamalesOaxaquenosArea
{
    private static let areaWidth:CGFloat = 10000
    private static let itemWidth:CGFloat = 32
    
    class func factoryItems(textures:MOptionTamalesOaxaquenosTextures) -> [MOptionTamalesOaxaquenosAreaItemProtocol]
    {
        var items:[MOptionTamalesOaxaquenosAreaItemProtocol] = []
        let itemWidth_2:CGFloat = itemWidth / 2.0
        let maxPositionX:CGFloat = areaWidth + itemWidth_2
        var positionX:CGFloat = itemWidth_2
        
        while positionX < maxPositionX
        {
            let item:MOptionTamalesOaxaquenosAreaItemProtocol = factoryItem(
                textures:textures,
                positionX:positionX)
            items.append(item)
            
            positionX += itemWidth
        }
        
        return items
    }
    
    //MARK: private
    
    private class func factoryItem(
        textures:MOptionTamalesOaxaquenosTextures,
        positionX:CGFloat) -> MOptionTamalesOaxaquenosAreaItemProtocol
    {
        
    }
}
