import Foundation

class MOptionWhistlesVsZombiesPlayerStrategyAliveShut:MOptionWhistlesVsZombiesPlayerStrategyAlive
{
    override func updateTexture(scene:ViewGameScene<MOptionWhistlesVsZombies>)
    {
        let texture:MGameTexture = scene.controller.model.textures.playerShut
        model.view?.updateTexture(texture:texture)
    }
}
