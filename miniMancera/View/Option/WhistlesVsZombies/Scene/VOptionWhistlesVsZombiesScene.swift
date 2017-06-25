import SpriteKit

class VOptionWhistlesVsZombiesScene:ViewGameScene
{
    private(set) weak var menu:VOptionWhistlesVsZombiesMenu!
    
    required init(controller:ControllerGame)
    {
        super.init(controller:controller)
        
        let background:VOptionWhistlesVsZombiesBackground = VOptionWhistlesVsZombiesBackground(
            controller:controller)
        
        let menu:VOptionWhistlesVsZombiesMenu = VOptionWhistlesVsZombiesMenu(
            controller:controller)
        self.menu = menu
        
        addChild(background)
        addChild(menu)
        
        addBase()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    //MARK: private
    
    private func addBase()
    {
        let items:[MOptionWhistlesVsZombiesBaseItem] = controller.model.base.items
        
        for item:MOptionWhistlesVsZombiesBaseItem in items
        {
            let viewItem:VOptionWhistlesVsZombiesBase = VOptionWhistlesVsZombiesBase(
                controller:controller,
                model:item)
            
            addChild(viewItem)
        }
    }
}
