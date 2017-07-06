import SpriteKit

class VOptionWhistlesVsZombiesPhysicSonicLimit:ViewGameNode<MOptionWhistlesVsZombies>
{
    private let kWidth:CGFloat = 30
    private let kHeight:CGFloat = 224
    
    override init(controller:ControllerGame<MOptionWhistlesVsZombies>)
    {
        let size:CGSize = CGSize(
            width:kWidth,
            height:kHeight)
        
        super.init(
            controller:controller,
            size:size,
            zPosition:MOptionWhistlesVsZombiesZPosition.Physics.rawValue)
        startPhysics()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: private
    
    override func positionStart()
    {
        let sceneWidth:CGFloat = MGame.sceneSize.height
        let width_2:CGFloat = kWidth / 2.0
        let height_2:CGFloat = kHeight / 2.0
        let positionX:CGFloat = sceneWidth + width_2
        
        position = CGPoint(x:positionX, y:height_2)
    }
    
    private func startPhysics()
    {
        let physicsBody:SKPhysicsBody = SKPhysicsBody(rectangleOf:size)
        physicsBody.categoryBitMask = MOptionWhistlesVsZombiesPhysicsStruct.SonicLimit
        physicsBody.contactTestBitMask = MOptionWhistlesVsZombiesPhysicsStruct.SonicBoom
        physicsBody.collisionBitMask = MOptionWhistlesVsZombiesPhysicsStruct.None
        self.physicsBody = physicsBody
    }
}
