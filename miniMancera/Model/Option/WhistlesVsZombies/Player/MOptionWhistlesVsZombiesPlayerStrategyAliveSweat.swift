import Foundation

class MOptionWhistlesVsZombiesPlayerStrategyAliveSweat:MOptionWhistlesVsZombiesPlayerStrategyAlive
{
    override func updateTexture(scene:ViewGameScene<MOptionWhistlesVsZombies>)
    {
        let texture:MGameTexture = scene.controller.model.textures.playerSweat
        model.view?.updateTexture(texture:texture)
    }
}
