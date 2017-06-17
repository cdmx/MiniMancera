import UIKit
import SpriteKit

class MOptionPollutedGardenPetuniaLife
{
    let textures:[SKTexture]
    let texturePlus:SKTexture
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
        textureSize = textures[0].size()
    }
}
