import UIKit
import SpriteKit

class MOptionPollutedGardenBubble:SKSpriteNode
{
    private weak var controller:COptionPollutedGarden!
    
    init(controller:COptionPollutedGarden)
    {
        super.init(texture: <#T##SKTexture?#>, color: <#T##UIColor#>, size: <#T##CGSize#>)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
