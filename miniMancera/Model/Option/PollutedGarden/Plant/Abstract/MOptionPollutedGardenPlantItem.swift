import SpriteKit

class MOptionPollutedGardenPlantItem:MGameUpdate<MOptionPollutedGarden>
{
    let positionX:CGFloat
    private(set) weak var textures:MOptionPollutedGardenTextures!
    private var strategy:MGameStrategy<MOptionPollutedGardenPlantItem, MOptionPollutedGarden>?
    
    init(textures:MOptionPollutedGardenTextures, positionX:CGFloat)
    {
        self.textures = textures
        self.positionX = positionX
        super.init()
        
        strategy = MOptionPollutedGardenPlantItemStrategyPop(model:self)
    }
    
    override func update(
        elapsedTime:TimeInterval,
        scene:ViewGameScene<MOptionPollutedGarden>)
    {
        strategy?.update(
            elapsedTime:elapsedTime,
            scene:scene)
    }
    
    //MARK: public
    
    func grow()
    {
        strategy = MOptionPollutedGardenPlantItemStrategyGrow(model:self)
    }
    
    func polluted()
    {
        strategy = MOptionPollutedGardenPlantItemStrategyPolluted(model:self)
    }
}
