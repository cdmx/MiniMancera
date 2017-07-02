import SpriteKit

class MOptionPollutedGardenPlantItemStrategyGrow:MGameStrategy<
    MOptionPollutedGardenPlantItem,
    MOptionPollutedGarden>
{
    private var lastElapsedTime:TimeInterval?
    private var level:Int
    private let maxLevel:Int
    private let kInitialLevel:Int = -1
    private let kDeltaTime:TimeInterval = 5
    
    override init(model:MOptionPollutedGardenPlantItem)
    {
        level = kInitialLevel
        maxLevel = model.animations.animationsPlantGrow.count
        super.init(model:model)
    }
    
    override func update(
        elapsedTime:TimeInterval,
        scene:ViewGameScene<MOptionPollutedGarden>)
    {
        if let lastElapsedTime:TimeInterval = self.lastElapsedTime
        {
            let deltaTime:TimeInterval = elapsedTime - lastElapsedTime
            
            if deltaTime > kDeltaTime
            {
                self.lastElapsedTime = elapsedTime
                level += 1
                
                if level >= maxLevel
                {
                    model.collect()
                }
                else
                {
                    let nextLevelAnimation:SKAction = model.animations.animationsPlantGrow[level]
                    model.viewPlant?.run(nextLevelAnimation)
                }
            }
        }
        else
        {
            lastElapsedTime = elapsedTime
        }
    }
}
