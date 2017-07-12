import UIKit

class VOptionWhistlesVsZombiesPointsCoin:ViewGameNode<MOptionWhistlesVsZombies>
{
    private let kPositionX:CGFloat = 35
    
    override init(controller:ControllerGame<MOptionWhistlesVsZombies>)
    {
        let texture:MGameTexture = controller.model.textures.coin
        
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
        position = CGPoint(x:kPositionX, y:0)
    }
}
