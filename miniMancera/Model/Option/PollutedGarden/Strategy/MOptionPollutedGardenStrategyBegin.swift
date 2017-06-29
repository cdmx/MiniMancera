import SpriteKit

class MOptionPollutedGardenStrategyBegin:MGameStrategyMain<MOptionPollutedGarden>
{
    private let kTimeout:TimeInterval = 1.25
    
    init(model:MOptionPollutedGarden)
    {
        let updateItems:[MGameUpdateProtocol] = [
            ]
        
        super.init(model:model, updateItems:updateItems)
    }
    
    override func update(
        elapsedTime:TimeInterval,
        scene:SKScene)
    {
        super.update(elapsedTime:elapsedTime, scene:scene)
        
        if elapsedTime > kTimeout
        {
            timeout(scene:scene)
        }
    }
    
    //MARK: private
    
    private func timeout(scene:SKScene)
    {
        model.activateGame()
    }
}
