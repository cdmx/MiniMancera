import Foundation

class MOptionWhistlesVsZombiesPlayerStrategyAliveStand:MOptionWhistlesVsZombiesPlayerStrategyAlive
{
    override func updateTexture(scene:ViewGameScene<MOptionWhistlesVsZombies>)
    {
        let texture:MGameTexture = scene.controller.model.textures.playerStand
        model.view?.updateTexture(texture:texture)
    }
}
