import SpriteKit

class MOptionPollutedGardenSceneGame:MOptionSceneGame<MOptionPollutedGarden, COptionPollutedGarden>
{
    private weak var hud:MOptionPollutedGardenHud!
    private weak var menu:MOptionPollutedGardenMenu!
    private weak var labelTitle:SKLabelNode?
    private let kTitleDuration:TimeInterval = 1.5
    private let kFadeInDuration:TimeInterval = 0.5
    private let kFontSize:CGFloat = 24
    private let kTitleVerticalAdd:CGFloat = 100
    
    override init(controller:COptionPollutedGarden)
    {
        super.init(controller:controller)
        
        let background:MOptionPollutedGardenBackground = MOptionPollutedGardenBackground(
            controller:controller)
        
        let hud:MOptionPollutedGardenHud = MOptionPollutedGardenHud(
            controller:controller)
        self.hud = hud
        
        let menu:MOptionPollutedGardenMenu = MOptionPollutedGardenMenu(
            controller:controller)
        self.menu = menu
        
        addChild(background)
        
        addChild(hud)
        addChild(menu)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func didMove(to view:SKView)
    {
        super.didMove(to:view)
        
        spawnPots()
        showTitle()
    }
    
    //MARK: private
    
    private func spawnPots()
    {
        let positions:[CGFloat] = MOptionPollutedGardenPotPosition.positionsFor(
            model:controller.model)
        
        for position:CGFloat in positions
        {
            spawnPot(position:position)
        }
    }
    
    private func spawnPot(position:CGFloat)
    {
        let flowerPot:MOptionPollutedGardenFlowerPot = MOptionPollutedGardenFlowerPot(
            controller:controller,
            positionX:position)
        
        addChild(flowerPot)
        
        flowerPot.animateAppear()
        
        spawnFlowerFor(flowerPot:flowerPot)
    }
    
    private func spawnFlowerFor(flowerPot:MOptionPollutedGardenFlowerPot)
    {
        
    }
    
    private func showTitle()
    {
        let width_2:CGFloat = controller.model.size.width / 2.0
        let height_2:CGFloat = controller.model.size.height / 2.0
        let positionY:CGFloat = height_2 + kTitleVerticalAdd
        
        let labelTitle:SKLabelNode = SKLabelNode(fontNamed:UIFont.kFontBold)
        labelTitle.text = String.localizedPollutedGarden(key:"MOptionPollutedGardenSceneGame_labelTitle")
        labelTitle.fontSize = kFontSize
        labelTitle.fontColor = SKColor.white
        labelTitle.position = CGPoint(x:width_2, y:positionY)
        self.labelTitle = labelTitle
        
        addChild(labelTitle)
        
        actionsActivateGame()
    }
    
    private func actionsActivateGame()
    {
        let actionDelay:SKAction = SKAction.wait(forDuration:kTitleDuration)
        let actionActivateGame:SKAction = SKAction.run(activateGame)
        let actions:[SKAction] = [
            actionDelay,
            actionActivateGame]
        let actionsSequence:SKAction = SKAction.sequence(actions)
        
        run(actionsSequence)
    }
    
    private func activateGame()
    {
        fadeInControls()
        labelTitle?.removeFromParent()
        controller.model.activateGame()
    }
    
    private func fadeInControls()
    {
        let actionFade:SKAction = SKAction.fadeIn(withDuration:kFadeInDuration)
        
        hud.run(actionFade)
        menu.run(actionFade)
    }
    
    override func updateNodes()
    {
        hud.update(elapsedTime:elapsedTime)
    }
}
