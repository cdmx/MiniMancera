import SpriteKit

class VOptionTamalesOaxaquenosPhysicHole:ViewGameNode<MOptionTamalesOaxaquenos>
{
    private let positionY:CGFloat
    private let width:CGFloat
    private let width_2:CGFloat
    private let height_2:CGFloat
    private let kHeight:CGFloat = 20
    
    override init(controller:ControllerGame<MOptionTamalesOaxaquenos>)
    {
        let sceneSize:CGSize = MGame.sceneSize
        let sceneHeight:CGFloat = sceneSize.height
        let sceneHeight_2:CGFloat = sceneHeight / 2.0
        width = sceneSize.width
        let size:CGSize = CGSize(
            width:width,
            height:kHeight)
        width_2 = width / 2.0
        height_2 = kHeight / 2.0
        positionY = height_2 - sceneHeight_2
        
        super.init(
            controller:controller,
            size:size,
            zPosition:MOptionTamalesOaxaquenosZPosition.Physics.rawValue)
        startPhysics()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: private
    
    override func positionStart()
    {
        position = CGPoint(x:0, y:positionY)
    }
    
    private func startPhysics()
    {
        let edgeFrame:CGRect = CGRect(
            x:-width_2,
            y:-height_2,
            width:width,
            height:kHeight)
        let physicsBody:SKPhysicsBody = SKPhysicsBody(edgeLoopFrom:edgeFrame)
        physicsBody.categoryBitMask = MOptionTamalesOaxaquenosPhysicsStruct.Hole
        physicsBody.contactTestBitMask = MOptionTamalesOaxaquenosPhysicsStruct.Player
        physicsBody.collisionBitMask = MOptionTamalesOaxaquenosPhysicsStruct.None
        self.physicsBody = physicsBody
    }
}
