import SpriteKit

class VOptionPollutedGardenPlant:ViewGameNode<MOptionPollutedGarden>
{
    private(set) weak var model:MOptionPollutedGardenPlantItem?
    private let kPhysicsWidth:CGFloat = 18
    private let kPhysicsHeight:CGFloat = 20
    private let kPhysicsY:CGFloat = -16
    
    init(
        controller:ControllerGame<MOptionPollutedGarden>,
        model:MOptionPollutedGardenPlantItem)
    {
        self.model = model
        let texture:MGameTexture = controller.model.textures.plantPoisoned
        
        super.init(
            controller:controller,
            texture:texture)
        startPhysics()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func positionStart()
    {
        guard
            
            let model:MOptionPollutedGardenPlantItem = self.model,
            let texturePot:MGameTexture = model.viewPot?.modelTexture,
            let modelTexture:MGameTexture = self.modelTexture
            
        else
        {
            return
        }
        
        let pointX:CGFloat = model.positionX
        let potY:CGFloat = model.positionY
        let potHeight_2:CGFloat = texturePot.height_2
        let height_2:CGFloat = modelTexture.height_2
        let positionY:CGFloat = potY + potHeight_2 + height_2
        
        position = CGPoint(x:pointX, y:positionY)
    }
    
    //MARK: private
    
    private func startPhysics()
    {
        let physicsSize:CGSize = CGSize(
            width:kPhysicsWidth,
            height:kPhysicsHeight)
        let physicsCenter:CGPoint = CGPoint(x:0, y:kPhysicsY)
        let physicsBody:SKPhysicsBody = SKPhysicsBody(
            rectangleOf:physicsSize,
            center:physicsCenter)
        physicsBody.isDynamic = false
        physicsBody.friction = 1
        physicsBody.allowsRotation = false
        physicsBody.restitution = 0
        
        physicsBody.categoryBitMask = MOptionPollutedGardenPhysicsStruct.Flower
        physicsBody.contactTestBitMask = MOptionPollutedGardenPhysicsStruct.Bubble
        physicsBody.collisionBitMask = MOptionPollutedGardenPhysicsStruct.None
        self.physicsBody = physicsBody
    }
    
    //MARK: public
    
    func polluted()
    {
        texture = modelTexture?.texture
    }
}
