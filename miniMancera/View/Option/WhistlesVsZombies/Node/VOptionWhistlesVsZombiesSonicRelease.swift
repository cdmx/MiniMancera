import SpriteKit

class VOptionWhistlesVsZombiesSonicRelease:ViewGameNode<MOptionWhistlesVsZombies>
{
    private weak var model:MOptionWhistlesVsZombiesSonicBoomItem?
    private let kColourBlendFactor:CGFloat = 1
    
    init(
        controller:ControllerGame<MOptionWhistlesVsZombies>,
        model:MOptionWhistlesVsZombiesSonicBoomItem)
    {
        self.model = model
        let size:CGSize = controller.model.textures.sonicReleaseAnimated.textureSize
        let animation:SKAction = controller.model.actions.actionSonicReleaseAnimation
        
        super.init(
            controller:controller,
            size:size,
            zPosition:MOptionWhistlesVsZombiesZPosition.SonicRelease.rawValue,
            colour:model.whistleType.colour)
        colorBlendFactor = kColourBlendFactor
        
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
        
        let barrelLength:CGFloat = model.whistleType.barrelLength
        let basePosition:CGPoint = model.base.position
        let positionX:CGFloat = basePosition.x + barrelLength
        let positionY:CGFloat = basePosition.y
        position = CGPoint(
            x:positionX,
            y:positionY)
    }
    
    //MARK: public
    
    func endRelease()
    {
        removeAllActions()
        removeFromParent()
    }
}
