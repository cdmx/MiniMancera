import Foundation

class MOptionPollutedGardenPlayerStrategyDefeated:MGameStrategy<
    MOptionPollutedGardenPlayer,
    MOptionPollutedGarden>
{
    private var startingTime:TimeInterval?
    
    override func update(
        elapsedTime:TimeInterval,
        scene:ViewGameScene<MOptionPollutedGarden>)
    {
        if startingTime == nil
        {
            startingTime = elapsedTime
            
            let texture:MGameTexture = scene.controller.model.textures.playerDefeated
            model.view?.defeated(texture:texture)
        }
    }
}
