import UIKit

class MOptionPollutedGardenBubbleItemType
{
    let colour:UIColor
    let radius:CGFloat
    let mass:CGFloat
    let angularVelocity:CGFloat
    let velocityX:CGFloat
    let velocityXExplosion:CGFloat
    private(set) weak var texture:MGameTexture!
    private let kExplosionMultiplier:CGFloat = 20
    private let kVelocityMultiplier:CGFloat = 50
    private let kMassMultiplier:CGFloat = 10000
    
    init(
        texture:MGameTexture,
        colour:UIColor,
        orientation:CGFloat)
    {
        self.texture = texture
        self.colour = colour
        radius = texture.width_2
        mass = texture.width_2 * kMassMultiplier
        angularVelocity = orientation
        velocityXExplosion = orientation * kExplosionMultiplier
        velocityX = orientation * kVelocityMultiplier
    }
}
