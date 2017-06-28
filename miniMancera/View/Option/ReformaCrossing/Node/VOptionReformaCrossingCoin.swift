import SpriteKit

class VOptionReformaCrossingCoin:ViewGameNode<MOptionReformaCrossing>
{
    private let positionY:CGFloat
    private let kAddPositionX:CGFloat = 50
    private let kAddPositionY:CGFloat = 10
    private let kDelayFade:TimeInterval = 0.6
    private let kFadeDuration:TimeInterval = 0.5
    private let kZPosition:CGFloat = 10100
 
    init(controller:ControllerGame<MOptionReformaCrossing>, positionY:CGFloat)
    {
        self.positionY = positionY
        let texture:MGameTexture = controller.model.textures.coin
        
        super.init(
            controller:controller,
            texture:texture)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func positionStart()
    {
        let sceneWidth:CGFloat = MGame.sceneSize.width
        let sceneWidth_2:CGFloat = sceneWidth / 2.0
        let positionX:CGFloat = sceneWidth_2 + kAddPositionX
        let positionY:CGFloat = self.positionY + kAddPositionY
        position = CGPoint(x:positionX, y:positionY)
    }
    
    //MARK: private
    
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
