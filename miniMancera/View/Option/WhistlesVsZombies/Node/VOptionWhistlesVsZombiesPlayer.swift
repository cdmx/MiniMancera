import UIKit

class VOptionWhistlesVsZombiesPlayer:ViewGameNode<MOptionWhistlesVsZombies>
{
    private let kPositionX:CGFloat = 30
    private let kPositionY:CGFloat = 222
    
    override init(controller:ControllerGame<MOptionWhistlesVsZombies>)
    {
        let texture:MGameTexture = controller.model.textures.playerStand
        
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
        position = CGPoint(x:kPositionX, y:kPositionY)
    }
    
    //MARK: public
    
    func updateTexture(texture:MGameTexture)
    {
        self.texture = texture.texture
    }
}
