import Foundation

class MOptionPollutedGardenStrategyBegin:MGameStrategyMain<MOptionPollutedGarden>
{
    private let kTimeout:TimeInterval = 1.25
    
    init(model:MOptionPollutedGarden)
    {
        let updateItems:[MGameUpdate<MOptionPollutedGarden>] = [
            model.plant,
            model.bubble]
        
        super.init(model:model, updateItems:updateItems)
    }
    
    override func update(
        elapsedTime:TimeInterval,
        scene:ViewGameScene<MOptionPollutedGarden>)
    {
        super.update(elapsedTime:elapsedTime, scene:scene)
        
        if elapsedTime > kTimeout
        {
            timeout()
        }
    }
    
    //MARK: private
    
    private func timeout()
    {
        model.activateGame()
    }
}
