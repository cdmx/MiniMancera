import SpriteKit

class VOptionWhistlesVsZombiesSonicBoom:ViewGameNode<MOptionWhistlesVsZombies>
{
    private weak var model:MOptionWhistlesVsZombiesSonicBoomItem?
    private let kColourBlendFactor:CGFloat = 1
    private let kVelocityX:CGFloat = 1
    
    init(
        controller:ControllerGame<MOptionWhistlesVsZombies>,
        model:MOptionWhistlesVsZombiesSonicBoomItem)
    {
        self.model = model
        let texture:MGameTexture = controller.model.textures.sonicBoom
        let colour:UIColor = model.whistleType.colour
        
        super.init(
            controller:controller,
            texture:texture,
            colour:colour)
        colorBlendFactor = kColourBlendFactor
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func positionStart()
    {
        guard
            
            let model:MOptionWhistlesVsZombiesSonicBoomItem = self.model
            
        else
        {
            return
        }
        
        let barrelLength:CGFloat = model.whistleType.barrelLength
        let basePosition:CGPoint = model.base.position
        let positionX:CGFloat = basePosition.x + barrelLength
        let positionY:CGFloat = basePosition.y
        position = CGPoint(
            x:positionX,
            y:positionY)
    }
    
    //MARK: private
    
    private func startPhysics()
    {
        guard
            
            let model:MOptionWhistlesVsZombiesSonicBoomItem = self.model,
            let modelTexture:MGameTexture = self.modelTexture
            
        else
        {
            return
        }
        
        let size:CGSize = modelTexture.size
        let physicsBody:SKPhysicsBody = SKPhysicsBody(rectangleOf:size)
        physicsBody.isDynamic = true
        physicsBody.friction = 0
        physicsBody.allowsRotation = false
        physicsBody.restitution = 1
        physicsBody.angularVelocity = 0
//        physicsBody.density = model.mass
        physicsBody.velocity = CGVector(
            dx:kVelocityX,
            dy:0)
        
        physicsBody.categoryBitMask = MOptionWhistlesVsZombiesPhysicsStruct.SonicBoom
        physicsBody.contactTestBitMask = MOptionWhistlesVsZombiesPhysicsStruct.None
        physicsBody.collisionBitMask = MOptionWhistlesVsZombiesPhysicsStruct.None
        self.physicsBody = physicsBody
    }
}
