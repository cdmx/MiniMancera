import SpriteKit

class VOptionTamalesOaxaquenosFloorGroundHill:ViewGameNode<MOptionTamalesOaxaquenos>
{
    private weak var viewGround:VOptionTamalesOaxaquenosFloorGround!
    private weak var viewHill:VOptionTamalesOaxaquenosFloorHill!
    private weak var model:MOptionTamalesOaxaquenosAreaFloorItemGroundHill!
    private let height_2:CGFloat
    private let groundPositionY:CGFloat
    private let grassPositionY:CGFloat
    private let kVerticalAlign:CGFloat = 150
    
    init(
        controller:ControllerGame<MOptionTamalesOaxaquenos>,
        model:MOptionTamalesOaxaquenosAreaFloorItemGroundHill)
    {
        self.model = model
        
        let viewGround:VOptionTamalesOaxaquenosFloorGround = VOptionTamalesOaxaquenosFloorGround(
            controller:controller,
            model:model)
        self.viewGround = viewGround
        
        let viewGrass:VOptionTamalesOaxaquenosFloorGrass = VOptionTamalesOaxaquenosFloorGrass(
            controller:controller,
            model:model)
        self.viewGrass = viewGrass
        
        let textureGround:MGameTexture = model.textureGround
        let textureGrass:MGameTexture = model.textureGrass
        let width:CGFloat = textureGround.width
        let groundHeight:CGFloat = textureGround.height
        let grassHeight:CGFloat = textureGrass.height
        let height:CGFloat = groundHeight + grassHeight
        height_2 = height / 2.0
        groundPositionY = textureGround.height_2 - height_2
        grassPositionY = groundPositionY + textureGround.height_2 + textureGrass.height_2
        let size:CGSize = CGSize(width:width, height:height)
        
        super.init(
            controller:controller,
            size:size,
            zPosition:MOptionTamalesOaxaquenosZPosition.Floor.rawValue)
        
        addChild(viewGround)
        addChild(viewGrass)
        
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
        let positionY:CGFloat = sceneHeight_2 - (kVerticalAlign + height_2)
        let positionX:CGFloat = model.positionX
        position = CGPoint(x:positionX, y:positionY)
        
        viewGround.position = CGPoint(x:0, y:groundPositionY)
        viewGrass.position = CGPoint(x:0, y:grassPositionY)
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
