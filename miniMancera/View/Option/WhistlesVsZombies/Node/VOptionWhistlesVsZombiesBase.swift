import SpriteKit

class VOptionWhistlesVsZombiesBase:SKSpriteNode
{
    private weak var controller:COptionWhistlesVsZombies!
    private let k
    
    init(controller:COptionWhistlesVsZombies)
    {
        self.controller = controller
        
        super.init(texture:texture, color:UIColor.clear, size:size)
        position = CGPoint(x:positionX, y:kInitialY)
        zPosition = kZPosition
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: private
    
    private func randomDuration() -> TimeInterval
    {
        let random:UInt32 = arc4random_uniform(kMaxAnimationduration)
        let randomTime:TimeInterval = TimeInterval(random) / kAnimationDurationDivider
        let totalTime:TimeInterval = randomTime + kMinAnimationDuration
        
        return totalTime
    }
    
    //MARK: public
    
    func animateAppear()
    {
        let duration:TimeInterval = randomDuration()
        let actionTranslate:SKAction = SKAction.move(to:endingPoint, duration:duration)
        
        run(actionTranslate)
    }
}
