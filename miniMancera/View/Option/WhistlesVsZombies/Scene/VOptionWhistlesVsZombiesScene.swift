import SpriteKit

class VOptionWhistlesVsZombiesScene:ViewGame<MOptionWhistlesVsZombies, COptionWhistlesVsZombies>
{
    override init(controller:COptionWhistlesVsZombies)
    {
        super.init(controller:controller)
        
        let background:VOptionWhistlesVsZombiesBackground = VOptionWhistlesVsZombiesBackground(
            controller:controller)
        
        addChild(background)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
}
