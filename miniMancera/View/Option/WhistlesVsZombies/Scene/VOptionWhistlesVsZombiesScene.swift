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
        let model:MOptionWhistlesVsZombies = controller.model
        
        let background:VOptionWhistlesVsZombiesBackground = VOptionWhistlesVsZombiesBackground(
            controller:controller)
        
        let menu:ViewGameNodeMenu<MOptionWhistlesVsZombies> = ViewGameNodeMenu(
            controller:controller,
            texture:model.textures.menu,
            orientation:UIInterfaceOrientation.landscapeLeft)
        model.viewMenu = menu
        
        addChild(background)
        factoryBases()
        
        addChild(menu)
    }
    
    private func factoryBases()
    {
        let bases:[MOptionWhistlesVsZombiesWhistleBase] = controller.model.whistle.bases
        
        for base:MOptionWhistlesVsZombiesWhistleBase in bases
        {
            let view:VOptionWhistlesVsZombiesBase = VOptionWhistlesVsZombiesBase(
                controller:controller,
                model:base)
            base.viewBase = view
            
            addChild(view)
        }
    }
    
    //MARK: public
    
    func addWhistle(base:MOptionWhistlesVsZombiesWhistleBase)
    {
        guard
            
            let view:VOptionWhistlesVsZombiesWhistle = VOptionWhistlesVsZombiesWhistle(
                controller:controller,
                model:base)
        
        else
        {
            return
        }
        
        base.viewWhistle = view
        
        addChild(view)
    }
    
    func addSonicBoomRelease(model:MOptionWhistlesVsZombiesSonicBoomItem)
    {
        let view:VOptionWhistlesVsZombiesSonicRelease = VOptionWhistlesVsZombiesSonicRelease(
            controller:controller,
            model:model)
        model.viewRelease = view
        
        addChild(view)
    }
    
    func addSonicBoom(model:MOptionWhistlesVsZombiesSonicBoomItem)
    {
        let view:VOptionWhistlesVsZombiesSonicBoom = VOptionWhistlesVsZombiesSonicBoom(
            controller:controller,
            model:model)
        model.viewBoom = view
        
        addChild(view)
    }
}
