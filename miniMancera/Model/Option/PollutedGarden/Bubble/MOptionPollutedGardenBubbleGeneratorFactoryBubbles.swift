import UIKit
import SpriteKit

extension MOptionPollutedGardenBubbleGenerator
{
    class func factoryBubbleTypes() -> [MOptionPollutedGardenBubbleType]
    {
        var bubbles:[MOptionPollutedGardenBubbleType] = []
        let images:[UIImage] = allImages()
        
        for image:UIImage in images
        {
            let bubbleRegular:MOptionPollutedGardenBubbleType = bubbleForImage(
                image:image,
                orientation:MOptionPollutedGardenBubbleType.Orientation.regular)
            let bubbleInversed:MOptionPollutedGardenBubbleType = bubbleForImage(
                image:image,
                orientation:MOptionPollutedGardenBubbleType.Orientation.inversed)
            
            bubbles.append(bubbleRegular)
            bubbles.append(bubbleInversed)
        }
        
        return bubbles
    }
    
    class func factoruBubbleExplodeTextures() -> [SKTexture]
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
    
    //MARK: private
    
    private class func allImages() -> [UIImage]
    {
        let images:[UIImage] = [
            #imageLiteral(resourceName: "assetPollutedGardenBubbleBig"),
            #imageLiteral(resourceName: "assetPollutedGardenBubbleMedium"),
            #imageLiteral(resourceName: "assetPollutedGardenBubbleSmall"),
            #imageLiteral(resourceName: "assetPollutedGardenBubbleMini")]
        
        return images
    }
    
    private class func bubbleForImage(
        image:UIImage,
        orientation:MOptionPollutedGardenBubbleType.Orientation) -> MOptionPollutedGardenBubbleType
    {
        let bubble:MOptionPollutedGardenBubbleType = MOptionPollutedGardenBubbleType(
            image:image,
            orientation:orientation)
        
        return bubble
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
