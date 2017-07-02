import UIKit

extension MOptionPollutedGardenBubble
{
    class func factoryBubbles(textures:MOptionPollutedGardenTextures) -> [MOptionPollutedGardenBubbleItemType]
    {
        let textures:[MGameTexture] = groupTextures(textures:textures)
        let colours:[UIColor] = MOptionPollutedGardenBubble.factoryColours()
        let types:[MOptionPollutedGardenBubbleItemType] = mixBubblesTypes(
            textures:textures,
            colours:colours)
        
        return types
    }
    
    //MARK: private
    
    private class func groupTextures(textures:MOptionPollutedGardenTextures) -> [MGameTexture]
    {
        let textures:[MGameTexture] = [
            textures.bubbleBig,
            textures.bubbleMedium,
            textures.bubbleSmall,
            textures.bubbleMini]
        
        return textures
    }
    
    private class func mixBubblesTypes(
        textures:[MGameTexture],
        colours:[UIColor]) -> [MOptionPollutedGardenBubbleItemType]
    {
        var types:[MOptionPollutedGardenBubbleItemType] = []
        
        for texture:MGameTexture in textures
        {
            for colour:UIColor in colours
            {
                let typePositive:MOptionPollutedGardenBubbleItemTypePositive = MOptionPollutedGardenBubbleItemTypePositive(
                    texture:texture,
                    colour:colour)
                let typeNegative:MOptionPollutedGardenBubbleItemTypeNegative = MOptionPollutedGardenBubbleItemTypeNegative(
                    texture:texture,
                    colour:colour)
                
                types.append(typePositive)
                types.append(typeNegative)
            }
        }
        
        return types
    }
}
