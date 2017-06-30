import UIKit

class MOptionPollutedGardenBubbleItem
{
    let colour:UIColor
    let radius:CGFloat
    let mass:CGFloat
    let velocityX:CGFloat
    let velocityXExplosion:CGFloat
    private(set) weak var texture:MGameTexture!
    
    init(type:MOptionPollutedGardenBubbleItemType)
    {
        texture = type.texture
        colour = type.colour
        radius = type.radius
        mass = type.mass
        velocityXExplosion = type.velocityXExplosion
        velocityX = type.velocityX
    }
}
