import UIKit
import SpriteKit

class MOptionPollutedGardenPetunia:SKSpriteNode
{
    private var lastElapsedTime:TimeInterval
    private var growTime:TimeInterval
    private weak var controller:COptionPollutedGarden!
    private weak var flowerPot:MOptionPollutedGardenFlowerPot!
    private var level:Int
    private let kGrowDeltaTime:TimeInterval = 2
    private let kAnimationDuration:TimeInterval = 0.3
    private let kZPosition:CGFloat = 400
    private let kInitialLevel:Int = -1
    
    init(controller:COptionPollutedGarden, flowerPot:MOptionPollutedGardenFlowerPot)
    {
        let size:CGSize = controller.model.petuniaLife.textureSize
        self.controller = controller
        self.flowerPot = flowerPot
        level = kInitialLevel
        lastElapsedTime = 0
        growTime = 0
        
        super.init(texture:nil, color:UIColor.clear, size:size)
        position = startPosition()
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
    
    private func startPosition() -> CGPoint
    {
        let potPosition:CGPoint = flowerPot.endingPoint
        let potX:CGFloat = potPosition.x
        let potY:CGFloat = potPosition.y
        let potHeight:CGFloat = flowerPot.size.height
        let potHeight_2:CGFloat = potHeight / 2.0
        let textureHeight:CGFloat = size.height
        let textureHeight_2:CGFloat = textureHeight / 2.0
        let positionY:CGFloat = potY + potHeight_2 + textureHeight_2
        let point:CGPoint = CGPoint(x:potX, y:positionY)
        
        print(point)
        
        return point
    }
    
    private func grow()
    {
        level += 1
        
        if level < controller.model.petuniaLife.textures.count
        {
            updateTexture()
        }
        else
        {
            collectFlower()
        }
        
        nextGrowTime()
    }
    
    private func nextGrowTime()
    {
        growTime = lastElapsedTime + kGrowDeltaTime
    }
    
    private func updateTexture()
    {
        let newTexture = controller.model.petuniaLife.textures[level]
        let actionFadeOut:SKAction = SKAction.fadeOut(withDuration:kAnimationDuration)
        let actionTexture:SKAction = SKAction.setTexture(newTexture, resize:false)
        let actionFadeIn:SKAction = SKAction.fadeIn(withDuration:kAnimationDuration)
        let actions:[SKAction] = [
            actionFadeOut,
            actionTexture,
            actionFadeIn]
        let actionsSequence:SKAction = SKAction.sequence(actions)
        
        run(actionsSequence)
    }
    
    private func collectFlower()
    {
        
    }
    
    //MARK: public
    
    func update(elapsedTime:TimeInterval)
    {
        lastElapsedTime = elapsedTime
        
        if growTime < elapsedTime
        {
            grow()
        }
    }
}
