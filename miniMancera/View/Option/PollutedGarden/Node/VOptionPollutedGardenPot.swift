import UIKit

class VOptionPollutedGardenPot:ViewGameNode<MOptionPollutedGarden>
{
    private weak var model:MOptionPollutedGardenPlantItem?
    private let kPositionY:CGFloat = 45
    
    init(
        controller:ControllerGame<MOptionPollutedGarden>,
        model:MOptionPollutedGardenPlantItem)
    {
        self.model = model
        let texture:MGameTexture = controller.model.textures.pot
        
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
        
            let model:MOptionPollutedGardenPlantItem = self.model
        
        else
        {
            return
        }
        
        position = CGPoint(x:model.positionX, y:kPositionY)
    }
}
