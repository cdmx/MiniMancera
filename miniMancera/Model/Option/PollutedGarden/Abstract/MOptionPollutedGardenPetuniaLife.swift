import UIKit
import SpriteKit

class MOptionPollutedGardenPetuniaLife
{
    let textures:[SKTexture]
    let texturePlus:SKTexture
    let texturePollution:SKTexture
    let texturePot:SKTexture
    let texturePetuniaSick:SKTexture
    let textureSize:CGSize
    
    private class func factoryTextures() -> [SKTexture]
    {
        let images:[UIImage] = [
            #imageLiteral(resourceName: "assetPollutedGardenPetunia0"),
            #imageLiteral(resourceName: "assetPollutedGardenPetunia1"),
            #imageLiteral(resourceName: "assetPollutedGardenPetunia2"),
            #imageLiteral(resourceName: "assetPollutedGardenPetunia3"),
            #imageLiteral(resourceName: "assetPollutedGardenPetunia4"),
            #imageLiteral(resourceName: "assetPollutedGardenPetunia5"),
            #imageLiteral(resourceName: "assetPollutedGardenPetunia6"),
            #imageLiteral(resourceName: "assetPollutedGardenPetunia7"),
            #imageLiteral(resourceName: "assetPollutedGardenPetunia8"),
            #imageLiteral(resourceName: "assetPollutedGardenPetunia9"),
            #imageLiteral(resourceName: "assetPollutedGardenPetunia10"),
            #imageLiteral(resourceName: "assetPollutedGardenPetunia11")]
        
        let textures:[SKTexture] = texturesFromImages(images:images)
        
        return textures
    }
    
    private class func texturesFromImages(images:[UIImage]) -> [SKTexture]
    {
        var textures:[SKTexture] = []
        
        for image:UIImage in images
        {
            let texture:SKTexture = SKTexture(image:image)
            textures.append(texture)
        }
        
        return textures
    }
    
    init()
    {
        textures = MOptionPollutedGardenPetuniaLife.factoryTextures()
        texturePlus = SKTexture(image:#imageLiteral(resourceName: "assetPollutedGardenPlusFlower"))
        texturePollution = SKTexture(image:#imageLiteral(resourceName: "assetPollutedGardenPollution"))
        texturePot = SKTexture(image:#imageLiteral(resourceName: "assetPollutedGardenFlowerPot"))
        texturePetuniaSick = SKTexture(image:#imageLiteral(resourceName: "assetPollutedGardenPetunia12"))
        textureSize = textures[0].size()
    }
}