import SpriteKit

class VOptionWhistlesVsZombiesScene:ViewGameScene<MOptionWhistlesVsZombies>
{
    required init(controller:ControllerGame<MOptionWhistlesVsZombies>)
    {
        super.init(controller:controller)
        physicsWorld.gravity = CGVector.zero
        factoryNodes()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: private

    private func factoryNodes()
    {
        let background:VOptionWhistlesVsZombiesBackground = VOptionWhistlesVsZombiesBackground(
            controller:controller)
        
        addChild(background)
        
        factoryBases()
    }
    
    private func factoryBases()
    {
        let bases:[MOptionWhistlesVsZombiesWhistleBase] = controller.model.whistle.bases
        
        for base:MOptionWhistlesVsZombiesWhistleBase in bases
        {
            let view:VOptionWhistlesVsZombiesBase = VOptionWhistlesVsZombiesBase(
                controller:controller,
                model:base)
            base.view = view
            
            addChild(view)
        }
    }
}
