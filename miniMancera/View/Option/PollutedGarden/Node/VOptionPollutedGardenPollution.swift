import UIKit
import SpriteKit

class VOptionPollutedGardenPollution:SKSpriteNode
{
    private weak var controller:COptionPollutedGarden!
    private let kAddPositionY:CGFloat = 30
    private let kMoveVertical:CGFloat = 90
    private let kDelayFade:TimeInterval = 0.2
    private let kAnimationDuration:TimeInterval = 2
    private let kZPosition:CGFloat = 200000
    
    init(petunia:VOptionPollutedGardenPetunia, controller:COptionPollutedGarden)
    {
        let texture:SKTexture = controller.model.petuniaLife.texturePollution
        let size:CGSize = texture.size()
        self.controller = controller
        
        super.init(texture:texture, color:UIColor.clear, size:size)
        zPosition = kZPosition
        startPosition(petunia:petunia)
        startActions()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: private
    
    private func startPosition(petunia:VOptionPollutedGardenPetunia)
    {
        let petuniaPos:CGPoint = petunia.position
        let petuniaX:CGFloat = petuniaPos.x
        let petuniaY:CGFloat = petuniaPos.y
        let positionY:CGFloat = petuniaY + kAddPositionY
        
        position = CGPoint(x:petuniaX, y:positionY)
    }
    
    private func createAnimation() -> SKAction
    {
        let actionFade:SKAction = SKAction.fadeOut(withDuration:kAnimationDuration)
        let actionTranslate:SKAction = SKAction.moveBy(
            x:0,
            y:kMoveVertical,
            duration:kAnimationDuration)
        let actions:[SKAction] = [
            actionFade,
            actionTranslate]
        let actionsGroup:SKAction = SKAction.group(actions)
        
        return actionsGroup
    }
    
    private func startActions()
    {
        let actionDelay:SKAction = SKAction.wait(forDuration:kDelayFade)
        let actionAnimation:SKAction = createAnimation()
        let actionLeaveGarden:SKAction = SKAction.run(leaveGarden)
        let actions:[SKAction] = [
            actionDelay,
            actionAnimation,
            actionLeaveGarden]
        let actionsSequence:SKAction = SKAction.sequence(actions)
        
        run(actionsSequence)
    }
    
    private func leaveGarden()
    {
        removeAllActions()
        removeFromParent()
    }
}
