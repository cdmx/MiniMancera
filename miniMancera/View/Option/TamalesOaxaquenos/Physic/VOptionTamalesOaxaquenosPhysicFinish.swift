import SpriteKit

class VOptionTamalesOaxaquenosPhysicFinish:ViewGameNode<MOptionTamalesOaxaquenos>
{
    private let positionX:CGFloat
    private let height:CGFloat
    private let width_2:CGFloat
    private let height_2:CGFloat
    private let kWidth:CGFloat = 250
    
    override init(controller:ControllerGame<MOptionTamalesOaxaquenos>)
    {
        let areaWidth:CGFloat = MOptionTamalesOaxaquenosArea.kWidth
        height = MGame.sceneSize.height
        let size:CGSize = CGSize(
            width:kWidth,
            height:height)
        width_2 = kWidth / 2.0
        height_2 = height / 2.0
        positionX = areaWidth - width_2
        
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
        position = CGPoint(x:positionX, y:height_2)
    }
    
    private func startPhysics()
    {
        let edgeFrame:CGRect = CGRect(
            x:-width_2,
            y:-height_2,
            width:kWidth,
            height:height)
        let physicsBody:SKPhysicsBody = SKPhysicsBody(edgeLoopFrom:edgeFrame)
        physicsBody.categoryBitMask = MOptionTamalesOaxaquenosPhysicsStruct.Finish
        physicsBody.contactTestBitMask = MOptionTamalesOaxaquenosPhysicsStruct.Player
        physicsBody.collisionBitMask = MOptionTamalesOaxaquenosPhysicsStruct.None
        self.physicsBody = physicsBody
    }
}
