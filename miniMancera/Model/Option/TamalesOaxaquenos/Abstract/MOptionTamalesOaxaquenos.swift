import SpriteKit

class MOptionTamalesOaxaquenos:MGame
{
    weak var viewMenu:ViewGameNodeMenu<MOptionTamalesOaxaquenos>?
    let textures:MOptionTamalesOaxaquenosTextures
    let actions:MOptionTamalesOaxaquenosActions
    let area:MOptionTamalesOaxaquenosArea
    let player:MOptionTamalesOaxaquenosPlayer
    let controls:MOptionTamalesOaxaquenosControls
    let camera:MOptionTamalesOaxaquenosCamera
    let contact:MOptionTamalesOaxaquenosContact
    private var strategy:MGameStrategyMain<MOptionTamalesOaxaquenos>?
    
    required init()
    {
        textures = MOptionTamalesOaxaquenosTextures()
        actions = MOptionTamalesOaxaquenosActions(textures:textures)
        area = MOptionTamalesOaxaquenosArea(textures:textures)
        player = MOptionTamalesOaxaquenosPlayer()
        controls = MOptionTamalesOaxaquenosControls()
        camera = MOptionTamalesOaxaquenosCamera(player:player)
        contact = MOptionTamalesOaxaquenosContact()
        
        super.init()
        
        generateLevel()
    }
    
    override var startSceneType:SKScene.Type?
    {
        get
        {
            return VOptionTamalesOaxaquenosScene.self
        }
    }
    
    override func gameStrategy<T>(modelType:T) -> MGameStrategyMain<T>? where T:MGame
    {
        return strategy as? MGameStrategyMain<T>
    }
    
    override func startLevel()
    {
        super.startLevel()
        
        score = 0
        strategy = MOptionTamalesOaxaquenosStrategyBegin(model:self)
    }
    
    override func activateGame()
    {
        super.activateGame()
        strategyGame()
    }
    
    //MARK: private
    
    private func strategyGame()
    {
        strategy = MOptionTamalesOaxaquenosStrategyGame(model:self)
        player.walk()
    }
    
    //MARK: public
    
    func generateLevel()
    {
        area.generateFloor()
        strategy = MOptionTamalesOaxaquenosStrategyBegin(model:self)
    }
    
    func strategyWait()
    {
        strategy = MOptionTamalesOaxaquenosStrategyWait(model:self)
    }
    
    func playerInHole()
    {
        player.hole()
        deActivateGame()
        strategy = MOptionTamalesOaxaquenosStrategyDefeated(model:self)
    }
    
    func playerFinish()
    {
        player.finish()
        deActivateGame()
        strategy = MOptionTamalesOaxaquenosStrategyFinish(model:self)
    }
}
