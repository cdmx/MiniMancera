import Foundation

class MOptionWhistlesVsZombiesPlayerStrategyAliveScared:MOptionWhistlesVsZombiesPlayerStrategyAlive
{
    override func updateTexture(scene:ViewGameScene<MOptionWhistlesVsZombies>)
    {
        let texture:MGameTexture = scene.controller.model.textures.playerScared
        model.view?.updateTexture(texture:texture)
    }
}
