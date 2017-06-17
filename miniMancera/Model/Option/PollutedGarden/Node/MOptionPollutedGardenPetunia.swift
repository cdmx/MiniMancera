import UIKit
import SpriteKit

class MOptionPollutedGardenPetunia:SKSpriteNode
{
    private weak var controller:COptionPollutedGarden!
    private weak var flowerPot:MOptionPollutedGardenFlowerPot!
    private var level:Int
    private var lastElapsedTime:TimeInterval
    private var growTime:TimeInterval
    private let kGrowDeltaTime:TimeInterval = 5
    private let kAnimationDuration:TimeInterval = 0.4
    private let kZPosition:CGFloat = 400
    private let kPhysicsWidth:CGFloat = 18
    private let kPhysicsHeight:CGFloat = 20
    private let kPhysicsY:CGFloat = -16
    private let kInitialLevel:Int = -1
    private let kPollutedLevel:Int = -2
    
    init(controller:COptionPollutedGarden, flowerPot:MOptionPollutedGardenFlowerPot)
    {
        let size:CGSize = controller.model.petuniaLife.textureSize
        self.controller = controller
        self.flowerPot = flowerPot
        level = kInitialLevel
        lastElapsedTime = 0
        growTime = 0
        
        super.init(texture:nil, color:UIColor.clear, size:size)
        flowerPot.petunia = self
        zPosition = kZPosition
        position = startPosition()
        startPhysics()
        collectFlower()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
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
        
        return point
    }
    
    private func startPhysics()
    {
        let physicsSize:CGSize = CGSize(width:kPhysicsWidth, height:kPhysicsHeight)
        let physicsCenter:CGPoint = CGPoint(x:0, y:kPhysicsY)
        let physicsBody:SKPhysicsBody = SKPhysicsBody(
            rectangleOf:physicsSize,
            center:physicsCenter)
        physicsBody.isDynamic = false
        physicsBody.friction = 1
        physicsBody.allowsRotation = false
        physicsBody.restitution = 0
        
        physicsBody.categoryBitMask = MOptionPollutedGardenPhysicsStruct.Flower
        physicsBody.contactTestBitMask = MOptionPollutedGardenPhysicsStruct.Bubble
        physicsBody.collisionBitMask = MOptionPollutedGardenPhysicsStruct.None
        self.physicsBody = physicsBody
    }
    
    private func grow()
    {
        level += 1
        
        if level == kInitialLevel
        {
            sickPetunia()
        }
        else
        {
            if level < controller.model.petuniaLife.textures.count
            {
                updateTexture()
            }
            else
            {
                collectFlower()
            }
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
        animateWithTexture(newTexture:newTexture)
    }
    
    private func sickPetunia()
    {
        let newTexture = controller.model.petuniaLife.texturePetuniaSick
        animateWithTexture(newTexture:newTexture)
    }
    
    private func animateWithTexture(newTexture:SKTexture)
    {
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
        controller.collectFlower(petunia:self)
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
    
    func polluted()
    {
        if level > kInitialLevel
        {
            controller.pollutedFlower(petunia:self)
            level = kPollutedLevel
            growTime = lastElapsedTime
        }
    }
}
