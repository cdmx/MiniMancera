import SpriteKit

extension VOptionReformaCrossingScene
{
    func factoryNodes()
    {
        let background:VOptionReformaCrossingBackground = VOptionReformaCrossingBackground(
            controller:controller)
        
        let hud:VOptionReformaCrossingHud = VOptionReformaCrossingHud(
            controller:controller)
        controller.model.hud.view = hud
        
        let menu:VOptionReformaCrossingMenu = VOptionReformaCrossingMenu(
            controller:controller)
        self.menu = menu
        
        let title:VOptionReformaCrossingTitle = VOptionReformaCrossingTitle()
        controller.model.title.view = title
        
        addChild(background)
        addChild(hud)
        addChild(menu)
        addChild(title)
    }
}
