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
    let radius:CGFloat
    let mass:CGFloat
    
    init(image:UIImage, orientation:Orientation)
    {
        self.texture = SKTexture(image:image)
        self.orientation = orientation
        size = texture.size()
        
        let sizeWidth_2:CGFloat = size.width / 2.0
        radius = sizeWidth_2
        mass = sizeWidth_2
    }
}
