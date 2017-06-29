import SpriteKit

class MOptionPollutedGardenHud:MGameUpdateProtocol
{
    weak var view:VOptionPollutedGardenHud?
    private var elapsedTime:TimeInterval?
    private let kTimeDelta:TimeInterval = 0.8
    
    //MARK: private
    
    private func updateStrings(model:MOptionPollutedGarden)
    {
        
    }

    //MARK: game update protocol
    
    func update(elapsedTime:TimeInterval, scene:SKScene)
    {
        if let lastElapsedTime:TimeInterval = self.elapsedTime
        {
            let delta:TimeInterval = abs(elapsedTime - lastElapsedTime)
            
            if delta > kTimeDelta
            {
                self.elapsedTime = elapsedTime
                
                guard
                    
                    let scene:VOptionPollutedGardenScene = scene as? VOptionPollutedGardenScene
                    
                else
                {
                    return
                }
                
                let model:MOptionPollutedGarden = scene.controller.model
                updateStrings(model:model)
            }
        }
        else
        {
            self.elapsedTime = elapsedTime
        }
    }
}
