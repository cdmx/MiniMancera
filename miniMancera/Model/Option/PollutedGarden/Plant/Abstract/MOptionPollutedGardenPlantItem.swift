import SpriteKit

class MOptionPollutedGardenPlantItem:MGameUpdateProtocol
{
    let positionX:CGFloat
    private(set) weak var textures:MOptionPollutedGardenTextures!
    private var strategy:MGameStrategy<MOptionPollutedGardenPlantItem>?
    
    init(textures:MOptionPollutedGardenTextures, positionX:CGFloat)
    {
        self.textures = textures
        self.positionX = positionX
        strategy = MOptionPollutedGardenPlantItemStrategyPop(model:self)
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
    
    //MARK: game update protocol
    
    func update(elapsedTime:TimeInterval, scene:SKScene)
    {
        strategy?.update(
            elapsedTime:elapsedTime,
            scene:scene)
    }
}
