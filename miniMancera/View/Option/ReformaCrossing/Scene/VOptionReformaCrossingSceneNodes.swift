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
        
        let title:VOptionReformaCrossingTitle = VOptionReformaCrossingTitle()
        controller.model.title.view = title
        
        addChild(background)
        addChild(hud)
        addChild(title)
    }
}
