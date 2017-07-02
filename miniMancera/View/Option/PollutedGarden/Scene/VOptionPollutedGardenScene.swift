import SpriteKit

class VOptionPollutedGardenScene:ViewGameScene<MOptionPollutedGarden>
{
    private let kGravityY:CGFloat = -0.1
    private let kExtraEdge:CGFloat = 400
    
    required init(controller:ControllerGame<MOptionPollutedGarden>)
    {
        controller.model.startLevel()
        
        super.init(controller:controller)
        startPhysics()
        factoryNodes()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: private
    
    private func startPhysics()
    {
        physicsWorld.gravity = CGVector(dx:0, dy:kGravityY)
        
        let origin:CGPoint = frame.origin
        let size:CGSize = frame.size
        let width:CGFloat = size.width
        let height:CGFloat = size.height
        let newHeight:CGFloat = height + kExtraEdge
        let newSize:CGSize = CGSize(width:width, height:newHeight)
        let edgeFrame:CGRect = CGRect(origin:origin, size:newSize)
        
        let physicsBody:SKPhysicsBody = SKPhysicsBody(edgeLoopFrom:edgeFrame)
        physicsBody.categoryBitMask = MOptionPollutedGardenPhysicsStruct.Scene
        physicsBody.contactTestBitMask = MOptionPollutedGardenPhysicsStruct.None
        physicsBody.collisionBitMask = MOptionPollutedGardenPhysicsStruct.None
        self.physicsBody = physicsBody
    }
    
    private func factoryNodes()
    {
        let model:MOptionPollutedGarden = controller.model
    
        let background:VOptionPollutedGardenBackground = VOptionPollutedGardenBackground(
            controller:controller)
        
        let floor:VOptionPollutedGardenFloor = VOptionPollutedGardenFloor(
            controller:controller)
        
        let player:VOptionPollutedGardenPlayer = VOptionPollutedGardenPlayer(
            controller:controller)
        model.player.view = player
        
        let hud:VOptionPollutedGardenHud = VOptionPollutedGardenHud(
            controller:controller)
        model.hud.view = hud
        
        let menu:VOptionPollutedGardenMenu = VOptionPollutedGardenMenu(
            controller:controller)
        model.menu.view = menu
        
        let controls:VOptionPollutedGardenControls = VOptionPollutedGardenControls(
            controller:controller)
        model.controls.view = controls
        
        let title:VOptionPollutedGardenTitle = VOptionPollutedGardenTitle()
        model.title.view = title
        
        addChild(background)
        addChild(floor)
        addChild(player)
        addChild(hud)
        addChild(menu)
        addChild(controls)
        addChild(title)
    }
    
    //MARK: public
    
    func addBubble(model:MOptionPollutedGardenBubbleItem)
    {
        let view:VOptionPollutedGardenBubble = VOptionPollutedGardenBubble(
            controller:controller,
            model:model)
        model.view = view
        
        addChild(view)
    }
    
    func addPot(model:MOptionPollutedGardenPlantItem)
    {
        let view:VOptionPollutedGardenPot = VOptionPollutedGardenPot(
            controller:controller,
            model:model)
        model.viewPot = view
        
        addChild(view)
    }
    
    func addPlant(model:MOptionPollutedGardenPlantItem)
    {
        let view:VOptionPollutedGardenPlant = VOptionPollutedGardenPlant(
            controller:controller,
            model:model)
        model.viewPlant = view
        
        addChild(view)
    }
    
    func addCollect(model:MOptionPollutedGardenPlantCollect)
    {
        let soundCoin:SKAction = controller.model.sounds.soundCoin
        controller.playSound(actionSound:soundCoin)
        
        let view:VOptionPollutedGardenCollect = VOptionPollutedGardenCollect(
            controller:controller,
            model:model)
        model.view = view
        
        addChild(view)
    }
    
    func addPoison(model:MOptionPollutedGardenPlantPoison)
    {
        let soundFail:SKAction = controller.model.sounds.soundFail
        controller.playSound(actionSound:soundFail)
        
        let view:VOptionPollutedGardenPoison = VOptionPollutedGardenPoison(
            controller:controller,
            model:model)
        model.view = view
        
        addChild(view)
    }
    
    func bubbleExploded()
    {
        let soundPop:SKAction = controller.model.sounds.soundPop
        controller.playSound(actionSound:soundPop)
    }
}
