import SpriteKit

class VOptionTamalesOaxaquenosFloor:ViewGameNode<MOptionTamalesOaxaquenos>
{
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
        physicsBody.friction = 1
        physicsBody.angularVelocity = 0
        physicsBody.allowsRotation = false
        physicsBody.affectedByGravity = false
        physicsBody.restitution = 0
        
        physicsBody.categoryBitMask = MOptionTamalesOaxaquenosPhysicsStruct.Floor
        physicsBody.contactTestBitMask = MOptionTamalesOaxaquenosPhysicsStruct.None
        physicsBody.collisionBitMask = MOptionTamalesOaxaquenosPhysicsStruct.None
        self.physicsBody = physicsBody
    }
}
