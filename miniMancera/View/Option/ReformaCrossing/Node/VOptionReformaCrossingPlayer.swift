import SpriteKit

class VOptionReformaCrossingPlayer:ViewGameNode<MOptionReformaCrossing>
{
//    private var lastElapsedTime:TimeInterval
    private var stopTime:TimeInterval?
    private let kAddPointY:CGFloat = 205
    private let kSpeed:CGFloat = 70
    private let kAnimationPerFrame:TimeInterval = 0.1
    private let kStopAnimationPerFrame:TimeInterval = 0.04
    private let kStopDuration:TimeInterval = 0.3
    private let kPhysicsWidth:CGFloat = 12
    private let kPhysicsHeight:CGFloat = 10
    private let kPhysicsYPos:CGFloat = -10
    
    override init(controller:ControllerGame<MOptionReformaCrossing>)
    {
        let texture:MGameTexture = controller.model.textures.playerStand
        
        super.init(
            controller:controller,
            texture:texture)
        isHidden = true
        startPhysics()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: private
    
    private func startPhysics()
    {
        let physicsSize:CGSize = CGSize(width:kPhysicsWidth, height:kPhysicsHeight)
        let physicsCenter:CGPoint = CGPoint(x:0, y:kPhysicsYPos)
        
        let physicsBody:SKPhysicsBody = SKPhysicsBody(
            rectangleOf:physicsSize,
            center:physicsCenter)
        physicsBody.isDynamic = true
        physicsBody.friction = 0
        physicsBody.angularVelocity = 0
        physicsBody.allowsRotation = true
        physicsBody.restitution = 1
        
        physicsBody.categoryBitMask = MOptionReformaCrossingPhysicsStruct.Player
        physicsBody.contactTestBitMask = MOptionReformaCrossingPhysicsStruct.Foe
        physicsBody.collisionBitMask = MOptionReformaCrossingPhysicsStruct.Foe
        self.physicsBody = physicsBody
    }
    
    private func collectLanes()
    {/*
        guard
            
            let lane:MOptionReformaCrossingLane = controller.model.laneGroup.playerCollectAt(
                position:position)
            
        else
        {
            return
        }
        
        controller.collectedLane(lane:lane)*/
    }
    
    //MARK: public
    
    func timeOut()
    {
        removeAllActions()
        
        let texture:MGameTexture = controller.model.textures.playerTimeout
        self.texture = texture.texture
    }
    
    func success()
    {
        removeAllActions()
        
        let texture:MGameTexture = controller.model.textures.playerSuccess
        self.texture = texture.texture
    }
    
    func hitAndRun()
    {
        removeAllActions()
        
        let texture:MGameTexture = controller.model.textures.playerHitAndRun
        self.texture = texture.texture
        size = texture.size
    }
    
    func animateWalk()
    {
        removeAllActions()
        
        let action:SKAction = controller.model.actions.actionPlayerWalkAnimation
        run(action)
    }
    
    func animateStop()
    {
        removeAllActions()
        
        let action:SKAction = controller.model.actions.actionPlayerStopAnimation
        run(action)
    }
    
    
    
    
    
    
    func update(elapsedTime:TimeInterval)
    {
//        lastElapsedTime = elapsedTime
        
        if let stopTime:TimeInterval = self.stopTime
        {
            if stopTime < elapsedTime
            {
//                resumeWalking()
            }
        }
        else
        {
            collectLanes()
        }
    }
}
