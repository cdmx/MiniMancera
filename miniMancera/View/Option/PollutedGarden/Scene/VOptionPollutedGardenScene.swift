import SpriteKit

class VOptionPollutedGardenScene:ViewGame<MOptionPollutedGarden, COptionPollutedGarden>
{
    let soundPop:SKAction
    private weak var player:VOptionPollutedGardenPlayer!
    private weak var controls:VOptionPollutedGardenControls!
    private weak var hud:VOptionPollutedGardenHud!
    private weak var menu:VOptionPollutedGardenMenu!
    private weak var floor:VOptionPollutedGardenFloor!
    private weak var labelTitle:SKLabelNode?
    private var petunias:[VOptionPollutedGardenPetunia]
    private var contactQueue:[SKPhysicsContact]
    private var nextBubbleSpawns:TimeInterval
    private let soundCoin:SKAction
    private let soundFail:SKAction
    private let kSoundCoin:String = "soundCoin.caf"
    private let kSoundPop:String = "soundPop.caf"
    private let kSoundFail:String = "soundFail.caf"
    private let kSceneTransitionDuration:TimeInterval = 1
    private let kTitleDuration:TimeInterval = 1.25
    private let kFadeInDuration:TimeInterval = 0.5
    private let kSpawnBubbleRate:TimeInterval = 0.1
    private let kWaitTransition:TimeInterval = 1.5
    private let kGravityY:CGFloat = -0.1
    private let kFontSize:CGFloat = 24
    private let kExtraEdge:CGFloat = 400
    private let kTitleVerticalAdd:CGFloat = 100
    private let kSpawnProbability:UInt32 = 15
    
    override init(controller:COptionPollutedGarden)
    {
        petunias = []
        contactQueue = []
        nextBubbleSpawns = 0
        soundCoin = SKAction.playSoundFileNamed(kSoundCoin, waitForCompletion:false)
        soundPop = SKAction.playSoundFileNamed(kSoundPop, waitForCompletion:false)
        soundFail = SKAction.playSoundFileNamed(kSoundFail, waitForCompletion:false)
        
        super.init(controller:controller)
        startPhysics()
        
        let background:VOptionPollutedGardenBackground = VOptionPollutedGardenBackground(
            controller:controller)
        
        let hud:VOptionPollutedGardenHud = VOptionPollutedGardenHud(
            controller:controller)
        self.hud = hud
        
        let menu:VOptionPollutedGardenMenu = VOptionPollutedGardenMenu(
            controller:controller)
        self.menu = menu
        
        let floor:VOptionPollutedGardenFloor = VOptionPollutedGardenFloor(
            controller:controller)
        self.floor = floor
        
        let player:VOptionPollutedGardenPlayer = VOptionPollutedGardenPlayer(
            controller:controller)
        self.player = player
        
        let controls:VOptionPollutedGardenControls = VOptionPollutedGardenControls(
            controller:controller)
        self.controls = controls
        
        addChild(background)
        addChild(floor)
        addChild(player)
        addChild(controls)
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
    
    override func update(_ currentTime:TimeInterval)
    {
        super.update(currentTime)
        
        updateContact(contactQueue:contactQueue)
        contactQueue = []
        checkBubbleSpawning(currentTime:currentTime)
    }
    
    override func updateNodes()
    {
        hud.update(elapsedTime:elapsedTime)
        updatePetunias()
        updatePlayer()
    }
    
    //MARK: private
    
    private func startPhysics()
    {
        physicsWorld.gravity = CGVector(dx:0, dy:kGravityY)
        physicsWorld.contactDelegate = self
        
        let origin:CGPoint = self.frame.origin
        let size:CGSize = self.frame.size
        let width:CGFloat = size.width
        let height:CGFloat = size.height
        let newSize:CGSize = CGSize(width:width, height:height + kExtraEdge)
        let frame:CGRect = CGRect(origin:origin, size:newSize)
        
        let physicsBody:SKPhysicsBody = SKPhysicsBody(edgeLoopFrom:frame)
        physicsBody.categoryBitMask = MOptionPollutedGardenPhysicsStruct.Scene
        physicsBody.contactTestBitMask = MOptionPollutedGardenPhysicsStruct.None
        physicsBody.collisionBitMask = MOptionPollutedGardenPhysicsStruct.None
        self.physicsBody = physicsBody
    }
    
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
        let flowerPot:VOptionPollutedGardenFlowerPot = VOptionPollutedGardenFlowerPot(
            controller:controller,
            positionX:position)
        
        addChild(flowerPot)
        
        flowerPot.animateAppear()
        
        spawnPlantFor(flowerPot:flowerPot)
    }
    
    private func spawnPlantFor(flowerPot:VOptionPollutedGardenFlowerPot)
    {
        let petunia:VOptionPollutedGardenPetunia = VOptionPollutedGardenPetunia(
            controller:controller,
            flowerPot:flowerPot)
        petunias.append(petunia)
        
        addChild(petunia)
    }
    
    private func updatePetunias()
    {
        for petunia:VOptionPollutedGardenPetunia in petunias
        {
            petunia.update(elapsedTime:elapsedTime)
        }
    }
    
    private func updatePlayer()
    {
        guard
            
            let lastTouchPositionX:CGFloat = controls.lastTouchPositionX()
            
            else
        {
            return
        }
        
        player.walkToPosition(positionX:lastTouchPositionX)
    }
    
    private func showTitle()
    {
        let width_2:CGFloat = controller.model.size.width / 2.0
        let height_2:CGFloat = controller.model.size.height / 2.0
        let positionY:CGFloat = height_2 + kTitleVerticalAdd
        
        let labelTitle:SKLabelNode = SKLabelNode(fontNamed:UIFont.kFontBold)
        labelTitle.text = String.localizedPollutedGarden(key:"VOptionPollutedGardenScene_labelTitle")
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
    
    private func checkBubbleSpawning(currentTime:TimeInterval)
    {
        if currentTime > nextBubbleSpawns
        {
            nextBubbleSpawns = currentTime + kSpawnBubbleRate
            spawnBubble()
        }
    }
    
    private func spawnBubble()
    {
        let should:Bool = shouldSpawnBubble()
        
        if should
        {
            let bubble:VOptionPollutedGardenBubble = controller.model.bubbleGenerator.randomBubble()
            
            addChild(bubble)
        }
    }
    
    private func shouldSpawnBubble() -> Bool
    {
        let random:UInt32 = arc4random_uniform(kSpawnProbability)
        
        if random == 0
        {
            return true
        }
        
        return false
    }
    
    private func afterDelayGameOver()
    {
        removeAllActions()
        
        let transition:SKTransition = SKTransition.crossFade(
            withDuration:kSceneTransitionDuration)
        let gameOverScene:VOptionPollutedGardenSceneEnd = VOptionPollutedGardenSceneEnd(
            controller:controller)
        
        view?.presentScene(gameOverScene, transition:transition)
    }
    
    //MARK: public
    
    func collectFlower(petunia:VOptionPollutedGardenPetunia)
    {
        playSound(actionSound:soundCoin)
        
        let plusFlower:VOptionPollutedGardenPlusFlower = VOptionPollutedGardenPlusFlower(
            petunia:petunia,
            controller:controller)
        
        addChild(plusFlower)
    }
    
    func flowerPolluted(petunia:VOptionPollutedGardenPetunia)
    {
        playSound(actionSound:soundFail)
        
        let pollution:VOptionPollutedGardenPollution = VOptionPollutedGardenPollution(
            petunia:petunia,
            controller:controller)
        
        addChild(pollution)
    }
    
    func allFlowersPolluted()
    {
        let actionDelay:SKAction = SKAction.wait(forDuration:kWaitTransition)
        let actionTransition:SKAction = SKAction.run
        { [weak self] in
            
            self?.afterDelayGameOver()
        }
        
        let actions:[SKAction] = [
            actionDelay,
            actionTransition]
        let actionsSequence:SKAction = SKAction.sequence(actions)
        
        run(actionsSequence)
    }
    
    //MARK: contact delegate
    
    func didBegin(_ contact:SKPhysicsContact)
    {
        contactQueue.append(contact)
    }
}
