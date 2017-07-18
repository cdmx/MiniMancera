import SpriteKit

class VOptionTamalesOaxaquenosFloor:ViewGameNode<MOptionTamalesOaxaquenos>
{
    private let kFriction:CGFloat = 1
    
    init(
        controller:ControllerGame<MOptionTamalesOaxaquenos>,
        size:CGSize)
    {
        super.init(
            controller:controller,
            size:size,
            zPosition:MOptionTamalesOaxaquenosZPosition.Floor.rawValue)
        
        startPhysics()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: private
    
    private func startPhysics()
    {
        let physicsBody:SKPhysicsBody = SKPhysicsBody(rectangleOf:size)
        physicsBody.isDynamic = false
        physicsBody.friction = kFriction
        physicsBody.angularVelocity = 0
        physicsBody.allowsRotation = false
        physicsBody.affectedByGravity = false
        physicsBody.restitution = 0
        
        physicsBody.categoryBitMask = MOptionTamalesOaxaquenosPhysicsStruct.Floor
        physicsBody.contactTestBitMask = MOptionTamalesOaxaquenosPhysicsStruct.Player
        physicsBody.collisionBitMask = MOptionTamalesOaxaquenosPhysicsStruct.None
        self.physicsBody = physicsBody
    }
}
