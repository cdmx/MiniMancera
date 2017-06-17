import UIKit
import SpriteKit

extension MOptionPollutedGardenBubbleGenerator
{
    private static let kTimePerFrame:TimeInterval = 0.2
    
    class func factoryExplodeAnimation() -> SKAction
    {
        let textures:[SKTexture] = explodeTextures()
        let actionAnimation:SKAction = SKAction.animate(
            with:textures,
            timePerFrame:kTimePerFrame,
            resize:false,
            restore:false)
        
        return actionAnimation
    }
    
    //MARK: private
    
    private class func explodeTextures() -> [SKTexture]
    {
        let images:[UIImage] = explodingImages()
        var textures:[SKTexture] = []
        
        for image:UIImage in images
        {
            let texture:SKTexture = SKTexture(image:image)
            textures.append(texture)
        }
        
        return textures
    }
    
    private class func explodingImages() -> [UIImage]
    {
        let images:[UIImage] = [
            #imageLiteral(resourceName: "assetPollutedGardenBubbleExplosion0"),
            #imageLiteral(resourceName: "assetPollutedGardenBubbleExplosion1"),
            #imageLiteral(resourceName: "assetPollutedGardenBubbleExplosion2"),
            #imageLiteral(resourceName: "assetPollutedGardenBubbleExplosion3")]
        
        return images
    }
}
