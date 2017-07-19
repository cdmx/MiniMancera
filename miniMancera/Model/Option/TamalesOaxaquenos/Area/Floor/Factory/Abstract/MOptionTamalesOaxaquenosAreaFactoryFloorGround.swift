import UIKit

extension MOptionTamalesOaxaquenosArea
{
    
    private static let kTotalHillTextures:UInt32 = 4
    private static let kCreateHillRatio:UInt32 = 10
    
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
