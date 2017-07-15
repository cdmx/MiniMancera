import UIKit

extension MOptionTamalesOaxaquenosArea
{
    private static let areaWidth:CGFloat = 10000
    private static let itemWidth:CGFloat = 32
    private static let kTotalGroundTextures:UInt32 = 4
    private static let kTotalGrassTextures:UInt32 = 4
    
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
        let item:MOptionTamalesOaxaquenosAreaItemProtocol = factoryGroundItem(
            textures:textures,
            positionX:positionX)
        
        return item
    }
    
    private class func factoryGroundItem(
        textures:MOptionTamalesOaxaquenosTextures,
        positionX:CGFloat) -> MOptionTamalesOaxaquenosAreaItemGroundProtocol
    {
        let textureGround:MGameTexture = randomGroundTexture(textures:textures)
        let textureGrass:MGameTexture = randomGrassTexture(textures:textures)
        let item:MOptionTamalesOaxaquenosAreaItemGroundGrass = MOptionTamalesOaxaquenosAreaItemGroundGrass(
            textureGround:textureGround,
            textureGrass:textureGrass,
            positionX:positionX)
        
        return item
        
    }
    private class func randomGroundTexture(
        textures:MOptionTamalesOaxaquenosTextures) -> MGameTexture
    {
        let random:UInt32 = arc4random_uniform(kTotalGroundTextures)
        
        switch random
        {
        case 0:
            
            return textures.ground0
            
        case 1:
            
            return textures.ground1
            
        case 2:
            
            return textures.ground2
            
        default:
            
            return textures.ground3
        }
    }
    
    private class func randomGrassTexture(
        textures:MOptionTamalesOaxaquenosTextures) -> MGameTexture
    {
        let random:UInt32 = arc4random_uniform(kTotalGrassTextures)
        
        switch random
        {
        case 0:
            
            return textures.grass0
            
        case 1:
            
            return textures.grass1
            
            
        case 2:
            
            return textures.grass2
            
        default:
            
            return textures.grass3
        }
    }
}
