import SpriteKit

class VOptionWhistlesVsZombiesPhysicHome:ViewGameNode<MOptionWhistlesVsZombies>
{
    private let kWidth:CGFloat = 56
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
        position = CGPoint.zero
    }
    
    private func startPhysics()
    {
        let physicsBody:SKPhysicsBody = SKPhysicsBody(rectangleOf:size)
        physicsBody.categoryBitMask = MOptionWhistlesVsZombiesPhysicsStruct.Scene
        physicsBody.contactTestBitMask = MOptionWhistlesVsZombiesPhysicsStruct.None
        physicsBody.collisionBitMask = MOptionWhistlesVsZombiesPhysicsStruct.None
        self.physicsBody = physicsBody
    }
}
