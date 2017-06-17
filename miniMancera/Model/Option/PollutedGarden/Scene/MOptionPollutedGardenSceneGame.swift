import SpriteKit

class MOptionPollutedGardenSceneGame:MOptionSceneGame<MOptionPollutedGarden, COptionPollutedGarden>
{
    private var petunias:[MOptionPollutedGardenPetunia]
    private weak var hud:MOptionPollutedGardenHud!
    private weak var menu:MOptionPollutedGardenMenu!
    private weak var floor:MOptionPollutedGardenFloor!
    private weak var labelTitle:SKLabelNode?
    private let soundCoin:SKAction
    private let kSoundCoin:String = "soundCoin.caf"
    private let kTitleDuration:TimeInterval = 2.5
    private let kFadeInDuration:TimeInterval = 0.5
    private let kFontSize:CGFloat = 24
    private let kTitleVerticalAdd:CGFloat = 100
    private let kSpawnProbability:UInt32 = 1
    
    override init(controller:COptionPollutedGarden)
    {
        petunias = []
        soundCoin = SKAction.playSoundFileNamed(kSoundCoin, waitForCompletion:false)
        
        super.init(controller:controller)
        
        let background:MOptionPollutedGardenBackground = MOptionPollutedGardenBackground(
            controller:controller)
        
        let hud:MOptionPollutedGardenHud = MOptionPollutedGardenHud(
            controller:controller)
        self.hud = hud
        
        let menu:MOptionPollutedGardenMenu = MOptionPollutedGardenMenu(
            controller:controller)
        self.menu = menu
        
        let floor:MOptionPollutedGardenFloor = MOptionPollutedGardenFloor(
            controller:controller)
        self.floor = floor
        
        addChild(background)
        addChild(floor)
        
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
        spawnBubble()
    }
    
    override func updateNodes()
    {
        hud.update(elapsedTime:elapsedTime)
        updatePetunias()
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
        
        spawnPlantFor(flowerPot:flowerPot)
    }
    
    private func spawnPlantFor(flowerPot:MOptionPollutedGardenFlowerPot)
    {
        let petunia:MOptionPollutedGardenPetunia = MOptionPollutedGardenPetunia(
            controller:controller,
            flowerPot:flowerPot)
        petunias.append(petunia)
        
        addChild(petunia)
    }
    
    private func updatePetunias()
    {
        for petunia:MOptionPollutedGardenPetunia in petunias
        {
            petunia.update(elapsedTime:elapsedTime)
        }
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
    
    private func shouldSpawn() -> Bool
    {
        let random:UInt32 = arc4random_uniform(kSpawnProbability)
        
        if random == 0
        {
            return true
        }
        
        return false
    }
    
    private func spawnBubble()
    {
        let should:Bool = shouldSpawn()
        
        if should
        {
            let bubble:MOptionPollutedGardenBubble = controller.model.bubbleGenerator.randomBubble()
            
            addChild(bubble)
        }
    }
    
    //MARK: public
    
    func collectFlower(petunia:MOptionPollutedGardenPetunia)
    {
        playSound(actionSound:soundCoin)
        
        let plusFlower:MOptionPollutedGardenPlusFlower = MOptionPollutedGardenPlusFlower(
            petunia:petunia,
            controller:controller)
        
        addChild(plusFlower)
    }
}
