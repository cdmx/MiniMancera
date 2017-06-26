import SpriteKit

class VOptionReformaCrossingFoe:ViewGameNode<MOptionReformaCrossing>
{
    private let kPhysicsRemoveHeight:CGFloat = 6
    private let kPhysicsAddWidth:CGFloat = 8
    
    init(controller:ControllerGame<MOptionReformaCrossing>, model:MOptionReformaCrossingFoeItem)
    {
        let texture:MGameTexture = model.texture
        
        super.init(
            controller:controller,
            texture:texture.texture,
            size:texture.size,
            zPosition:MOptionReformaCrossingZPosition.Foe.rawValue)
        
        let lane:MOptionReformaCrossingLane = model.lane
        xScale = lane.scaleHorizontal
        startPhysics(size:size)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: private
    
    private func startPhysics(size:CGSize)
    {
        let physicsHeight:CGFloat = size.height - kPhysicsRemoveHeight
        let physicsWidth:CGFloat = size.width + kPhysicsAddWidth
        let physicsSize:CGSize = CGSize(width:physicsWidth, height:physicsHeight)
        
        let physicsBody:SKPhysicsBody = SKPhysicsBody(rectangleOf:physicsSize)
        physicsBody.isDynamic = true
        physicsBody.friction = 1
        physicsBody.angularVelocity = 0
        physicsBody.allowsRotation = false
        physicsBody.restitution = 0
        
        physicsBody.categoryBitMask = MOptionReformaCrossingPhysicsStruct.Foe
        physicsBody.contactTestBitMask = MOptionReformaCrossingPhysicsStruct.Foe
        physicsBody.collisionBitMask = MOptionReformaCrossingPhysicsStruct.None
        self.physicsBody = physicsBody
    }
    
    private func leaveStreet()
    {
//        lane.removeFoe(item:self)
        removeAllActions()
        removeFromParent()
    }
}
