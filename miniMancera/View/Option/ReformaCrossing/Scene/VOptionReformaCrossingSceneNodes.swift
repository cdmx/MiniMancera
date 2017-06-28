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
        
        let stop:VOptionReformaCrossingStop = VOptionReformaCrossingStop(
            controller:controller)
        controller.model.stop.view = stop
        
        addChild(background)
        addChild(hud)
        addChild(menu)
        addChild(stop)
        addChild(title)
    }
}
