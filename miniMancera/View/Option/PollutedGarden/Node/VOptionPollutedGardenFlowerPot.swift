import UIKit
import SpriteKit

class VOptionPollutedGardenFlowerPot:SKSpriteNode
{
    let endingPoint:CGPoint
    weak var petunia:VOptionPollutedGardenPetunia?
    private weak var controller:COptionPollutedGarden!
    private let kMinAnimationDuration:TimeInterval = 0.3
    private let kAnimationDurationDivider:TimeInterval = 10
    private let kMaxAnimationduration:UInt32 = 25
    private let kZPosition:CGFloat = 500
    private let kInitialY:CGFloat = 45
    private let kFinalY:CGFloat = 66
    
    init(controller:COptionPollutedGarden, positionX:CGFloat)
    {
        let texture:SKTexture = controller.model.petuniaLife.texturePot
        let size:CGSize = texture.size()
        self.controller = controller
        endingPoint = CGPoint(x:positionX, y:kFinalY)
        
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
