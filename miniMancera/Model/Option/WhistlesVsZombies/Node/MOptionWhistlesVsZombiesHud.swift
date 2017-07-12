import Foundation

class MOptionWhistlesVsZombiesHud:MGameUpdate<MOptionWhistlesVsZombies>
{
    weak var model:MOptionWhistlesVsZombies!
    weak var view:VOptionWhistlesVsZombiesHud?
    private var lastElapsedTime:TimeInterval?
    private let kUpdateRate:TimeInterval = 0.3
    
    override func update(
        elapsedTime:TimeInterval,
        scene:ViewGameScene<MOptionWhistlesVsZombies>)
    {
        if let lastElapsedTime:TimeInterval = self.lastElapsedTime
        {
            let deltaTime:TimeInterval = abs(elapsedTime - lastElapsedTime)
            
            if deltaTime > kUpdateRate
            {
                self.lastElapsedTime = elapsedTime
                updateView()
            }
        }
        else
        {
            lastElapsedTime = elapsedTime
        }
    }
    
    //MARK: private
    
    private func updateView()
    {
        let zombies:String = "\(model.score)"
        let coins:String = "\(model.coins)"
        
        view?.update(zombies:zombies, coins:coins)
    }
}
