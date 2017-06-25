import SpriteKit

class MOptionReformaCrossingCoin:SKSpriteNode
{
    private weak var controller:COptionReformaCrossing!
    private let kAddPositionX:CGFloat = 50
    private let kAddPositionY:CGFloat = 10
    private let kDelayFade:TimeInterval = 0.6
    private let kFadeDuration:TimeInterval = 0.5
    private let kZPosition:CGFloat = 10100
    
    init(lane:MOptionReformaCrossingLane, controller:COptionReformaCrossing)
    {
        let texture:SKTexture = SKTexture(image:#imageLiteral(resourceName: "assetReformaCrossingCoin"))
        let size:CGSize = texture.size()
        self.controller = controller
        
        super.init(texture:texture, color:UIColor.clear, size:size)
        zPosition = kZPosition
        startPosition(lane:lane)
        startActions()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: private
    
    private func startPosition(lane:MOptionReformaCrossingLane)
    {/*
        let sceneWidth_2:CGFloat = controller.model.size.width / 2.0
        let positionX:CGFloat = sceneWidth_2 + kAddPositionX
        let positionY:CGFloat = lane.verticalPosition + kAddPositionY
        position = CGPoint(x:positionX, y:positionY)*/
    }
    
    private func startActions()
    {
        let actionDelay:SKAction = SKAction.wait(forDuration:kDelayFade)
        let actionFade:SKAction = SKAction.fadeOut(withDuration:kFadeDuration)
        let actionLeaveStreet:SKAction = SKAction.run(leaveStreet)
        let actions:[SKAction] = [
            actionDelay,
            actionFade,
            actionLeaveStreet]
        let actionsSequence:SKAction = SKAction.sequence(actions)
        
        run(actionsSequence)
    }
    
    private func leaveStreet()
    {
        removeAllActions()
        removeFromParent()
    }
}
