import Foundation

class MOptionWhistlesVsZombiesHud:MGameUpdate<MOptionWhistlesVsZombies>
{
    weak var model:MOptionWhistlesVsZombies!
    weak var view:VOptionWhistlesVsZombiesHud?
    
    override func update(
        elapsedTime:TimeInterval,
        scene:ViewGameScene<MOptionWhistlesVsZombies>)
    {
    }
}
