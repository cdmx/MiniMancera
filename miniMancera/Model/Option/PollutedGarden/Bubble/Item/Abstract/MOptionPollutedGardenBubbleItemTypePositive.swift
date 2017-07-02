import UIKit

class MOptionPollutedGardenBubbleItemTypePositive:MOptionPollutedGardenBubbleItemType
{
    private let kOrientation:CGFloat = 1
    
    init(texture:MGameTexture, colour:UIColor)
    {
        super.init(
            texture:texture,
            colour:colour,
            orientation:kOrientation)
    }
}
