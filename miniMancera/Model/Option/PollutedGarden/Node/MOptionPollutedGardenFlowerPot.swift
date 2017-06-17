import UIKit
import SpriteKit

class MOptionPollutedGardenFlowerPot:SKSpriteNode
{
    let endingPoint:CGPoint
    private weak var controller:COptionPollutedGarden!
    private let kMinAnimationDuration:TimeInterval = 0.3
    private let kAnimationDurationDivider:TimeInterval = 10
    private let kMaxAnimationduration:UInt32 = 25
    private let kZPosition:CGFloat = 500
    private let kInitialY:CGFloat = 45
    private let kFinalY:CGFloat = 70
    
    init(controller:COptionPollutedGarden, positionX:CGFloat)
    {
        let texture:SKTexture = SKTexture(image:#imageLiteral(resourceName: "assetPollutedGardenFlowerPot"))
        let size:CGSize = texture.size()
        self.controller = controller
        endingPoint = CGPoint(x:positionX, y:kFinalY)
        
        super.init(texture:texture, color:UIColor.clear, size:size)
        position = CGPoint(x:positionX, y:kInitialY)
        zPosition = kZPosition
        isUserInteractionEnabled = true
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func touchesEnded(_ touches:Set<UITouch>, with event:UIEvent?)
    {
        if controller.model.gameActive
        {
        }
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
