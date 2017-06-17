import UIKit
import SpriteKit

extension MOptionPollutedGardenPlayer
{
    private static let kTimePerFrame:TimeInterval = 0.2
    
    class func factoryAnimation() -> SKAction
    {
        let textures:[SKTexture] = animationTextures()
        let actionAnimate:SKAction = SKAction.animate(
            with:textures,
            timePerFrame:kTimePerFrame,
            resize:false,
            restore:false)
        let actionRepeat:SKAction = SKAction.repeatForever(actionAnimate)
        
        return actionRepeat
    }
    
    //MARK: private
    
    private class func animationImages() -> [UIImage]
    {
        let images:[UIImage] = [
            #imageLiteral(resourceName: "assetPollutedGardenPlayer2"),
            #imageLiteral(resourceName: "assetPollutedGardenPlayer3")]
        
        return images
    }
    
    private class func animationTextures() -> [SKTexture]
    {
        let images:[UIImage] = animationImages()
        var textures:[SKTexture] = []
        
        for image:UIImage in images
        {
            let texture:SKTexture = SKTexture(image:image)
            textures.append(texture)
        }
        
        return textures
    }
}
