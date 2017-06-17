import UIKit
import SpriteKit

class MOptionPollutedGardenBubbleType
{
    enum Orientation:CGFloat
    {
        case regular = 1
        case inversed = -1
    }
    
    let texture:SKTexture
    let orientation:Orientation
    let size:CGSize
    
    init(image:UIImage, orientation:Orientation)
    {
        self.texture = SKTexture(image:image)
        self.orientation = orientation
        size = texture.size()
    }
}
