import UIKit

class VOptionWhistlesVsZombiesSonicBoom:ViewGameNode<MOptionWhistlesVsZombies>
{
    private weak var model:MOptionWhistlesVsZombiesSonicBoomItem?
    private let kColourBlendFactor:CGFloat = 1
    
    init(
        controller:ControllerGame<MOptionWhistlesVsZombies>,
        model:MOptionWhistlesVsZombiesSonicBoomItem)
    {
        self.model = model
        let texture:MGameTexture = controller.model.textures.sonicBoom
        let colour:UIColor = model.whistleType.colour
        
        super.init(
            controller:controller,
            texture:texture,
            colour:colour)
        colorBlendFactor = kColourBlendFactor
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func positionStart()
    {
        guard
            
            let model:MOptionWhistlesVsZombiesSonicBoomItem = self.model
            
        else
        {
            return
        }
        
        let barrelLength:CGFloat = model.whistleType.barrelLength
        let basePosition:CGPoint = model.base.position
        let positionX:CGFloat = basePosition.x
        let positionY:CGFloat = basePosition.y + barrelLength
        position = CGPoint(
            x:positionX,
            y:positionY)
    }
}
