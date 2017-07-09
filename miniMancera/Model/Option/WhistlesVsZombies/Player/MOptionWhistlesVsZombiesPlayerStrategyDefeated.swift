import Foundation

class MOptionWhistlesVsZombiesPlayerStrategyDefeated:MGameStrategy<
    MOptionWhistlesVsZombiesPlayer,
    MOptionWhistlesVsZombies>
{
    private var startingTime:TimeInterval?
    
    override func update(
        elapsedTime:TimeInterval,
        scene:ViewGameScene<MOptionWhistlesVsZombies>)
    {
        if startingTime == nil
        {
            startingTime = elapsedTime
            updateTexture(scene:scene)
        }
    }
    
    //MARK: private
    
    private func updateTexture(scene:ViewGameScene<MOptionWhistlesVsZombies>)
    {
        let texture:MGameTexture = scene.controller.model.textures.playerDefeated
        model.view?.updateTexture(texture:texture)
    }
}
