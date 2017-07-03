import Foundation

class VOptionWhistlesVsZombiesWhistle:ViewGameNode<MOptionWhistlesVsZombies>
{
    private weak var model:MOptionWhistlesVsZombiesWhistleBase!
    
    init?(
        controller:ControllerGame<MOptionWhistlesVsZombies>,
        model:MOptionWhistlesVsZombiesWhistleBase)
    {
        guard
        
            let texture:MGameTexture = model.whistleType?.textureGame
        
        else
        {
            return nil
        }
        
        self.model = model
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
        position = model.position()
    }
}
