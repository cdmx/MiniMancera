import UIKit
import SpriteKit

class MOptionPollutedGardenBubble:SKSpriteNode
{
    private weak var controller:COptionPollutedGarden!
    
    init(
        controller:COptionPollutedGarden,
        bubbleType:MOptionPollutedGardenBubbleType,
        colour:UIColor,
        position:CGPoint)
    {
        super.init(
            texture:bubbleType.texture,
            color:colour,
            size:bubbleType.size)
        xScale = bubbleType.orientation.rawValue
        self.position = position
        self.controller = controller
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
