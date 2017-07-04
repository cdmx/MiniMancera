import SpriteKit

class VOptionWhistlesVsZombiesSonicRelease:ViewGameNode<MOptionWhistlesVsZombies>
{
    private weak var model:MOptionWhistlesVsZombiesSonicBoomItem?
    
    init(
        controller:ControllerGame<MOptionWhistlesVsZombies>,
        model:MOptionWhistlesVsZombiesSonicBoomItem)
    {
        self.model = model
        let size:CGSize = controller.model.textures.sonicReleaseAnimated.textures[0].size()
        let animation:SKAction = controller.model.actions.actionSonicReleaseAnimation
        
        super.init(
            controller:controller,
            size:size,
            zPosition:MOptionWhistlesVsZombiesZPosition.SonicBoom.rawValue)
        
        run(animation)
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
        
        position = model.base.position
    }
    
    //MARK: public
    
    func endRelease()
    {
        removeAllActions()
        removeFromParent()
    }
}
