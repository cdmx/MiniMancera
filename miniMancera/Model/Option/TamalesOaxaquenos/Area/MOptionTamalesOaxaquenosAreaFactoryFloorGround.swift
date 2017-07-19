import UIKit

extension MOptionTamalesOaxaquenosArea
{
    private static let kTotalGroundTextures:UInt32 = 4
    private static let kTotalGrassTextures:UInt32 = 4
    private static let kTotalHillTextures:UInt32 = 4
    private static let kCreateHillRatio:UInt32 = 10
    private static let kHillLengthRatio:UInt32 = 5
    private static let kHillHeightRatio:UInt32 = 30
    private static var hillHeight:CGFloat = 0
    private static var remainHills:Int = 0
    
    class func factoryGroundItem(
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
    
    //MARK: private
    
    private class func tryHill()
    {
        let randomShouldCreate:UInt32 = arc4random_uniform(kCreateHillRatio)
        
        if randomShouldCreate == 0
        {
            randomHillLength()
            randomHillHeight()
        }
    }
    
    private class func randomHillLength()
    {
        let randomLength:UInt32 = arc4random_uniform(kHillLengthRatio) + 1
        remainHills = Int(randomLength)
    }
    
    private class func randomHillHeight()
    {
        let random:UInt32 = arc4random_uniform(kHillHeightRatio)
        hillHeight = CGFloat(random)
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
            hillHeight:hillHeight,
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
