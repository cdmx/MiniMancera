import UIKit

class MOptionPollutedGardenBubbleItem:MGameUpdate<MOptionPollutedGarden>
{
    weak var view:VOptionPollutedGardenBubble?
    let colour:UIColor
    let position:CGPoint
    let radius:CGFloat
    let mass:CGFloat
    let scaleX:CGFloat
    let angularVelocity:CGFloat
    let velocityY:CGFloat
    let velocityX:CGFloat
    let velocityXExplosion:CGFloat
    private(set) weak var texture:MGameTexture!
    private var strategy:MGameStrategy<MOptionPollutedGardenBubbleItem, MOptionPollutedGarden>?
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
        scaleX = type.scaleX
        angularVelocity = type.angularVelocity
        velocityXExplosion = type.velocityXExplosion
        velocityX = type.velocityX
        velocityY = MOptionPollutedGardenBubbleItem.randomVelocity()
        self.position = position
        
        super.init()
        strategy = MOptionPollutedGardenBubbleItemStrategyAlive(model:self)
    }
    
    override func update(
        elapsedTime:TimeInterval,
        scene:ViewGameScene<MOptionPollutedGarden>)
    {
        strategy?.update(
            elapsedTime:elapsedTime,
            scene:scene)
    }
    
    //MARK: public
    
    func explode()
    {
        strategy = MOptionPollutedGardenBubbleItemStrategyExploded(model:self)
    }
    
    func alive() -> Bool
    {
        guard
        
            let _:MOptionPollutedGardenBubbleItemStrategyAlive = strategy as? MOptionPollutedGardenBubbleItemStrategyAlive
        
        else
        {
            return false
        }
        
        return true
    }
}
