import SpriteKit

class VOptionTamalesOaxaquenosFloorGroundHill:ViewGameNode<MOptionTamalesOaxaquenos>
{
    private weak var viewGround:VOptionTamalesOaxaquenosFloorGround!
    private weak var viewHill:VOptionTamalesOaxaquenosFloorHill!
    private weak var model:MOptionTamalesOaxaquenosAreaFloorItemGroundHill!
    private let height_2:CGFloat
    private let groundPositionY:CGFloat
    private let hillPositionY:CGFloat
    private let kVerticalAlign:CGFloat = 125
    
    init(
        controller:ControllerGame<MOptionTamalesOaxaquenos>,
        model:MOptionTamalesOaxaquenosAreaFloorItemGroundHill)
    {
        self.model = model
        
        let viewGround:VOptionTamalesOaxaquenosFloorGround = VOptionTamalesOaxaquenosFloorGround(
            controller:controller,
            model:model)
        self.viewGround = viewGround
        
        let viewHill:VOptionTamalesOaxaquenosFloorHill = VOptionTamalesOaxaquenosFloorHill(
            controller:controller,
            model:model)
        self.viewHill = viewHill
        
        let textureGround:MGameTexture = model.textureGround
        let textureHill:MGameTexture = model.textureHill
        let width:CGFloat = textureGround.width
        let groundHeight:CGFloat = textureGround.height
        let hillHeight:CGFloat = textureHill.height
        let height:CGFloat = groundHeight + hillHeight
        height_2 = height / 2.0
        groundPositionY = textureGround.height_2 - height_2
        hillPositionY = groundPositionY + textureGround.height_2 + textureHill.height_2
        let size:CGSize = CGSize(width:width, height:height)
        
        super.init(
            controller:controller,
            size:size,
            zPosition:MOptionTamalesOaxaquenosZPosition.Floor.rawValue)
        
        addChild(viewGround)
        addChild(viewHill)
        
        startPhysics()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func positionStart()
    {
        let sceneHeight:CGFloat = MGame.sceneSize.height
        let sceneHeight_2:CGFloat = sceneHeight / 2.0
        let hillHeight:CGFloat = model.hillHeight
        let positionY:CGFloat = sceneHeight_2 - (kVerticalAlign + height_2) - hillHeight
        let positionX:CGFloat = model.positionX
        position = CGPoint(x:positionX, y:positionY)
        
        viewGround.position = CGPoint(x:0, y:groundPositionY)
        viewHill.position = CGPoint(x:0, y:hillPositionY)
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
