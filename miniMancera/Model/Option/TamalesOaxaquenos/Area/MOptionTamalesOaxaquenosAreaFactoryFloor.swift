import UIKit

extension MOptionTamalesOaxaquenosArea
{
    private static let kItemWidth:CGFloat = 32
    private static let kTotalGroundTextures:UInt32 = 4
    private static let kTotalGrassTextures:UInt32 = 4
    private static let kTotalHillTextures:UInt32 = 4
    private static let kCreateHillRatio:UInt32 = 100
    private static let kHillLengthRatio:UInt32 = 5
    private static var remainHills:Int = 0
    
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
    
    private class func factoryGroundItem(
        textures:MOptionTamalesOaxaquenosTextures,
        positionX:CGFloat) -> MOptionTamalesOaxaquenosAreaFloorItemGroundProtocol
    {
        let textureGround:MGameTexture = randomGroundTexture(textures:textures)
        let item:MOptionTamalesOaxaquenosAreaFloorItemGroundProtocol
        
        if remainHills > 0
        {
            remainHills -= 1
            
            item = factoryGroundHillItem(
                textures:textures,
                textureGround:textureGround,
                positionX:positionX)
        }
        else
        {
            item = factoryGroundGrassItem(
                textures:textures,
                textureGround:textureGround,
                positionX:positionX)
            
            tryHill()
        }
        
        return item
    }
    
    private class func tryHill()
    {
        let randomShouldCreate:UInt32 = arc4random_uniform(kCreateHillRatio)
        
        if randomShouldCreate == 0
        {
            let randomLength:UInt32 = arc4random_uniform(kHillLengthRatio)
            remainHills = Int(randomLength)
        }
    }
    
    private class func factoryGroundGrassItem(
        textures:MOptionTamalesOaxaquenosTextures,
        textureGround:MGameTexture,
        positionX:CGFloat) -> MOptionTamalesOaxaquenosAreaFloorItemGroundGrass
    {
        let textureGrass:MGameTexture = randomGrassTexture(textures:textures)
        let item:MOptionTamalesOaxaquenosAreaFloorItemGroundGrass = MOptionTamalesOaxaquenosAreaFloorItemGroundGrass(
            textureGround:textureGround,
            textureGrass:textureGrass,
            positionX:positionX)
        
        return item
    }
    
    private class func factoryGroundHillItem(
        textures:MOptionTamalesOaxaquenosTextures,
        textureGround:MGameTexture,
        positionX:CGFloat) -> MOptionTamalesOaxaquenosAreaFloorItemGroundHill
    {
        let textureHill:MGameTexture = randomHillTexture(textures:textures)
        let item:MOptionTamalesOaxaquenosAreaFloorItemGroundHill = MOptionTamalesOaxaquenosAreaFloorItemGroundHill(
            textureGround:textureGround,
            textureHill:textureHill,
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
    
    private class func randomHillTexture(
        textures:MOptionTamalesOaxaquenosTextures) -> MGameTexture
    {
        let random:UInt32 = arc4random_uniform(kTotalHillTextures)
        
        switch random
        {
        case 0:
            
            return textures.hill0
            
        case 1:
            
            return textures.hill1
            
        case 2:
            
            return textures.hill2
            
        default:
            
            return textures.hill3
        }
    }
}
