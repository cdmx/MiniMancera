import SpriteKit

class VOptionWhistlesVsZombiesZombie:ViewGameNode<MOptionWhistlesVsZombies>
{
    private weak var model:MOptionWhistlesVsZombiesZombieItem?
    
    init(
        controller:ControllerGame<MOptionWhistlesVsZombies>,
        model:MOptionWhistlesVsZombiesZombieItem)
    {
        self.model = model
        
        super.init(
            controller:controller,
            texture:model.type.textureStand)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    override func positionStart()
    {
        guard
        
            let model:MOptionWhistlesVsZombiesZombieItem = self.model
        
        else
        {
            return
        }
        
        position = model.position()
    }
    
    //MARK: public
    
    func walk()
    {
        guard
            
            let model:MOptionWhistlesVsZombiesZombieItem = self.model
            
        else
        {
            return
        }
        
        let animation:SKAction = model.type.animatedWalking
        run(animation)
    }
    
    func wait()
    {
        removeAllActions()
        texture = modelTexture?.texture
    }
}
