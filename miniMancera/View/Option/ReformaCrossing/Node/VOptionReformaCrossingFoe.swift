import SpriteKit

class VOptionReformaCrossingFoe:ViewGameNode<MOptionReformaCrossing>
{
    private(set) weak var model:MOptionReformaCrossingFoeItem?
    private let kPhysicsRemoveHeight:CGFloat = 6
    private let kPhysicsAddWidth:CGFloat = 8
    private let kVelocityMultiplier:CGFloat = 50
    
    init(controller:ControllerGame<MOptionReformaCrossing>, model:MOptionReformaCrossingFoeItem)
    {
        self.model = model
        let texture:MGameTexture = model.texture
        
        super.init(
            controller:controller,
            texture:texture)
        
        let lane:MOptionReformaCrossingLane = model.lane
        let direction:CGFloat = lane.direction
        xScale = direction
        startPhysics(direction:direction)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func positionStart()
    {
        positionWithTrip()
    }
    
    //MARK: private
    
    private func startPhysics(direction:CGFloat)
    {
        let velocity:CGFloat = direction * kVelocityMultiplier
        let physicsHeight:CGFloat = size.height - kPhysicsRemoveHeight
        let physicsWidth:CGFloat = size.width + kPhysicsAddWidth
        let physicsSize:CGSize = CGSize(width:physicsWidth, height:physicsHeight)
        
        let physicsBody:SKPhysicsBody = SKPhysicsBody(rectangleOf:physicsSize)
        physicsBody.isDynamic = true
        physicsBody.friction = 1
        physicsBody.angularVelocity = 0
        physicsBody.allowsRotation = false
        physicsBody.restitution = 0
        physicsBody.velocity = CGVector(dx:velocity, dy:0)
        
        physicsBody.categoryBitMask = MOptionReformaCrossingPhysicsStruct.Foe
        physicsBody.contactTestBitMask = MOptionReformaCrossingPhysicsStruct.Foe
        physicsBody.collisionBitMask = MOptionReformaCrossingPhysicsStruct.None
        self.physicsBody = physicsBody
    }
    
    //MARK: public
    
    func positionWithTrip()
    {
        guard
            
            let trip:MOptionReformaCrossingFoeItemTrip = model?.trip
        
        else
        {
            return
        }
        
        position = CGPoint(
            x:trip.positionX,
            y:trip.positionY)
    }
}
