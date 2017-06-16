import SpriteKit

class MOptionPollutedGardenSceneGame:MOptionSceneGame<MOptionPollutedGarden, COptionPollutedGarden>
{
    override init(controller:COptionPollutedGarden)
    {
        super.init(controller:controller)
        
        let background:MOptionPollutedGardenBackground = MOptionPollutedGardenBackground(
            controller:controller)
        
        addChild(background)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
