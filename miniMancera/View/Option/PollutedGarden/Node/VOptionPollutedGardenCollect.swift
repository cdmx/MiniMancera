import Foundation

class VOptionPollutedGardenCollect:ViewGameNode<MOptionPollutedGarden>
{
    private weak var model:MOptionPollutedGardenPlantCollect?
    
    init(
        controller:ControllerGame<MOptionPollutedGarden>,
        model:MOptionPollutedGardenPlantCollect)
    {
        self.model = model
        let texture:MGameTexture = controller.model.textures.collect
        
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
            
            let model:MOptionPollutedGardenPlantCollect = self.model
            
        else
        {
            return
        }
        
        position = model.position()
    }
}
