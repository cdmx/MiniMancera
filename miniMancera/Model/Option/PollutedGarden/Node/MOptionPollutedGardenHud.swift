import Foundation

class MOptionPollutedGardenHud:MGameUpdate<MOptionPollutedGarden>
{
    weak var view:VOptionPollutedGardenHud?
    private var elapsedTime:TimeInterval?
    private let kTimeDelta:TimeInterval = 0.8
    
    override func update(
        elapsedTime:TimeInterval,
        scene:ViewGameScene<MOptionPollutedGarden>)
    {
        if let lastElapsedTime:TimeInterval = self.elapsedTime
        {
            let delta:TimeInterval = abs(elapsedTime - lastElapsedTime)
            
            if delta > kTimeDelta
            {
                self.elapsedTime = elapsedTime
                
                let model:MOptionPollutedGarden = scene.controller.model
                updateStrings(model:model)
            }
        }
        else
        {
            self.elapsedTime = elapsedTime
        }
    }
    
    //MARK: private
    
    private func updateStrings(model:MOptionPollutedGarden)
    {
        let score:String = "\(model.currentScore)"
        let max:String = "\(model.score)"
        
        view?.update(score:score, max:max)
    }
}
