import UIKit

class MOptionPollutedGardenBubbleItem:MGameUpdate<MOptionPollutedGarden>
{
    weak var view:VOptionPollutedGardenBubble?
    let colour:UIColor
    let position:CGPoint
    let radius:CGFloat
    let mass:CGFloat
    let angularVelocity:CGFloat
    let velocityY:CGFloat
    let velocityX:CGFloat
    let velocityXExplosion:CGFloat
    private(set) weak var texture:MGameTexture!
    private static let kMaxVelocity:UInt32 = 100
    
    private class func randomVelocity() -> CGFloat
    {
        let random:UInt32 = arc4random_uniform(kMaxVelocity)
        let vectorVelocity:CGFloat = -CGFloat(random)
        
        return vectorVelocity
    }
    
    init(
        type:MOptionPollutedGardenBubbleItemType,
        position:CGPoint)
    {
        texture = type.texture
        colour = type.colour
        radius = type.radius
        mass = type.mass
        angularVelocity = type.angularVelocity
        velocityXExplosion = type.velocityXExplosion
        velocityX = type.velocityX
        velocityY = MOptionPollutedGardenBubbleItem.randomVelocity()
        self.position = position
        
        super.init()
    }
    
    override func update(
        elapsedTime:TimeInterval,
        scene:ViewGameScene<MOptionPollutedGarden>)
    {
        
    }
}
