import Foundation

class MOptionPollutedGardenStrategyEnd:MGameStrategyMain<MOptionPollutedGarden>
{
    private var initialTime:TimeInterval?
    private let kWait:TimeInterval = 1.5
    
    init(model:MOptionPollutedGarden)
    {
        let updateItems:[MGameUpdate<MOptionPollutedGarden>] = [
            model.bubble,
            model.hud,
            model.plant,
            model.player,
            model.contact]
        
        super.init(model:model, updateItems:updateItems)
    }
    
    override func update(
        elapsedTime:TimeInterval,
        scene:ViewGameScene<MOptionPollutedGarden>)
    {
        super.update(elapsedTime:elapsedTime, scene:scene)
        
        if let initialTime:TimeInterval = self.initialTime
        {
            let deltaTime:TimeInterval = elapsedTime - initialTime
            
            if deltaTime > kWait
            {
                timeOut(scene:scene)
            }
        }
        else
        {
            self.initialTime = elapsedTime
        }
    }
    
    //MARK: private
    
    private func timeOut(scene:ViewGameScene<MOptionPollutedGarden>)
    {
        guard
            
            let controller:COptionPollutedGarden = scene.controller as? COptionPollutedGarden
        
        else
        {
            return
        }
        
        controller.showGameOver()
    }
}
