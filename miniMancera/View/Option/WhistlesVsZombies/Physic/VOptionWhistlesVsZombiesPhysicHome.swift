import SpriteKit

class VOptionWhistlesVsZombiesPhysicHome:ViewGameNode<MOptionWhistlesVsZombies>
{
    private let kWidth:CGFloat = 62
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
        let width_2:CGFloat = kWidth / 2.0
        let height_2:CGFloat = kHeight / 2.0
        
        position = CGPoint(x:width_2, y:height_2)
    }
    
    private func startPhysics()
    {
        let physicsBody:SKPhysicsBody = SKPhysicsBody(rectangleOf:size)
        physicsBody.categoryBitMask = MOptionWhistlesVsZombiesPhysicsStruct.Home
        physicsBody.contactTestBitMask = MOptionWhistlesVsZombiesPhysicsStruct.None
        physicsBody.collisionBitMask = MOptionWhistlesVsZombiesPhysicsStruct.None
        self.physicsBody = physicsBody
    }
}
