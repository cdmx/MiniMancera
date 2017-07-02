import UIKit

class VOptionPollutedGardenPoison:ViewGameNode<MOptionPollutedGarden>
{
    private weak var model:MOptionPollutedGardenPlantPoison?
    
    init(
        controller:ControllerGame<MOptionPollutedGarden>,
        model:MOptionPollutedGardenPlantPoison)
    {
        self.model = model
        let texture:MGameTexture = controller.model.textures.poison
        
        super.init(
            controller:controller,
            texture:texture)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func positionStart()
    {
        guard
            
            let model:MOptionPollutedGardenPlantPoison = self.model
            
        else
        {
            return
        }
        
        position = model.position()
    }
}
