import UIKit

extension MOptionTamalesOaxaquenosArea
{
    private static let kItemWidth:CGFloat = 384
    private static let kTotalTextures:UInt32 = 4
    
    class func factoryPerspectiveItems(
        textures:MOptionTamalesOaxaquenosTextures) -> [MOptionTamalesOaxaquenosAreaPerspectiveItem]
    {
        var items:[MOptionTamalesOaxaquenosAreaPerspectiveItem] = []
        let itemWidth_2:CGFloat = kItemWidth / 2.0
        let maxPositionX:CGFloat = kWidth + itemWidth_2
        var positionX:CGFloat = itemWidth_2
        
        while positionX < maxPositionX
        {
            let item:MOptionTamalesOaxaquenosAreaPerspectiveItem = factoryItem(
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
        positionX:CGFloat) -> MOptionTamalesOaxaquenosAreaPerspectiveItem
    {
        let texture:MGameTexture = randomTexture(textures:textures)
        let item:MOptionTamalesOaxaquenosAreaPerspectiveItem = MOptionTamalesOaxaquenosAreaPerspectiveItem(
            texture:texture,
            positionX:positionX)
        
        return item
    }
    
    private class func randomTexture(
        textures:MOptionTamalesOaxaquenosTextures) -> MGameTexture
    {
        let random:UInt32 = arc4random_uniform(kTotalTextures)
        
        switch random
        {
        case 0:
            
            return textures.perspective0
            
        case 1:
            
            return textures.perspective1
            
        case 2:
            
            return textures.perspective2
            
        default:
            
            return textures.perspective3
        }
    }
}
