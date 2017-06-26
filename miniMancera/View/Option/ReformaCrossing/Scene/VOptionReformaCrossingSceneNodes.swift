import SpriteKit

extension VOptionReformaCrossingScene
{
    func factoryNodes()
    {
        let background:VOptionReformaCrossingBackground = VOptionReformaCrossingBackground(
            controller:controller)
        
        let hud:VOptionReformaCrossingHud = VOptionReformaCrossingHud(
            controller:controller)
        self.hud = hud
        
        addChild(background)
        addChild(hud)
    }
}
