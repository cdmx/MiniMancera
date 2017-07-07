import SpriteKit

class VOptionWhistlesVsZombiesPhysicHome:ViewGameNode<MOptionWhistlesVsZombies>
{
    private let width_2:CGFloat
    private let height_2:CGFloat
    private let kWidth:CGFloat = 62
    private let kHeight:CGFloat = 224
    
    override init(controller:ControllerGame<MOptionWhistlesVsZombies>)
    {
        let size:CGSize = CGSize(
            width:kWidth,
            height:kHeight)
        width_2 = kWidth / 2.0
        height_2 = kHeight / 2.0
        
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
        position = CGPoint(x:width_2, y:height_2)
    }
    
    private func startPhysics()
    {
        let edgeFrame:CGRect = CGRect(
            x:-width_2,
            y:-height_2,
            width:kWidth,
            height:kHeight)
        let physicsBody:SKPhysicsBody = SKPhysicsBody(edgeLoopFrom:edgeFrame)
        physicsBody.categoryBitMask = MOptionWhistlesVsZombiesPhysicsStruct.Home
        physicsBody.contactTestBitMask = MOptionWhistlesVsZombiesPhysicsStruct.None
        physicsBody.collisionBitMask = MOptionWhistlesVsZombiesPhysicsStruct.None
        self.physicsBody = physicsBody
    }
}
