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
}
